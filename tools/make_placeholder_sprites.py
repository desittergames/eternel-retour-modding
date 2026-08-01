#!/usr/bin/env python3
"""Generate the example mods' sprite sheets.

Every image in this repository is produced by this script. Nothing here is taken from the game, and that is
deliberate: the game's own art is licensed and cannot be redistributed, so a public example mod must bring art
of its own. Yours must too -- see the "assets" note in the README.

The sheets are intentionally plain shapes. They exist to prove the *pipeline* (sheet + animations.yaml entry +
config), not to look good. Replace them with real art in your own mod.

Layout matches what the animations.yaml entries in the examples declare:

    32x32 cells, 8 columns x 4 rows
    row 0 (frames  0-7)   idle
    row 1 (frames  8-15)  walk
    row 2 (frames 16-23)  attack
    row 3 (frames 24-31)  dead

Usage:  python tools/make_placeholder_sprites.py
"""
from __future__ import annotations

import math
import pathlib

try:
    from PIL import Image, ImageDraw
except ImportError:  # pragma: no cover - a helpful message beats a stack trace
    raise SystemExit("This script needs Pillow:  pip install pillow")

CELL = 32
COLS = 8
ROWS = 4

ROOT = pathlib.Path(__file__).resolve().parent.parent


def blob(draw: ImageDraw.ImageDraw, cx: float, cy: float, r: float, body, edge) -> None:
    """A simple round body with a darker rim, so the shape reads at gameplay size."""
    draw.ellipse([cx - r, cy - r * 0.85, cx + r, cy + r * 0.85], fill=body, outline=edge, width=2)


def eyes(draw: ImageDraw.ImageDraw, cx: float, cy: float, r: float, open_amount: float) -> None:
    """Two eyes; `open_amount` 0..1 squashes them (a blink, or a wince when hit)."""
    if open_amount <= 0.05:
        return
    ew, eh = max(1.5, r * 0.16), max(1.0, r * 0.22 * open_amount)
    for sx in (-1, 1):
        ex = cx + sx * r * 0.32
        draw.ellipse([ex - ew, cy - eh, ex + ew, cy + eh], fill=(20, 20, 28, 255))


def frame(index: int, row: int, body, edge):
    """One 32x32 cell. Each row animates differently so the clips are visibly distinct in game."""
    img = Image.new("RGBA", (CELL, CELL), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    t = index / COLS  # 0..1 through the row
    # The body deliberately occupies only ~45% of the cell. The game sizes a creep from its `scale`, NOT from
    # the cell size, so a sprite that fills its cell edge-to-edge renders far larger than a character sprite of
    # the same scale (which sits in its cell with margins). Matching that padding keeps these examples in
    # proportion with the game's own creeps instead of dwarfing the player.
    cx, cy, r = CELL / 2, CELL / 2, CELL * 0.22

    if row == 0:  # idle — a gentle breath
        bob = math.sin(t * math.tau) * 1.2
        blob(d, cx, cy + bob, r, body, edge)
        eyes(d, cx, cy + bob - 2, r, 1.0)
    elif row == 1:  # walk — bigger bob plus a squash, so movement reads
        bob = math.sin(t * math.tau) * 2.4
        squash = 1.0 + math.cos(t * math.tau) * 0.12
        blob(d, cx, cy + bob, r * squash, body, edge)
        eyes(d, cx, cy + bob - 2, r, 1.0)
    elif row == 2:  # attack — wind up small, then lunge big
        grow = 0.8 + (t * 0.5 if t < 0.5 else (1.0 - t) * 0.5) * 2
        blob(d, cx, cy, r * grow, body, edge)
        eyes(d, cx, cy - 2, r, 0.4)  # narrowed
    else:  # dead — deflate and fade
        fade = max(0.0, 1.0 - t)
        rr = r * (0.35 + 0.65 * fade)
        col = (body[0], body[1], body[2], int(255 * fade))
        edg = (edge[0], edge[1], edge[2], int(255 * fade))
        d.ellipse([cx - rr, cy + r * 0.5 - rr * 0.4, cx + rr, cy + r * 0.5 + rr * 0.4], fill=col, outline=edg)
    return img


def sheet(path: pathlib.Path, body, edge) -> None:
    out = Image.new("RGBA", (CELL * COLS, CELL * ROWS), (0, 0, 0, 0))
    for row in range(ROWS):
        for col in range(COLS):
            out.paste(frame(col, row, body, edge), (col * CELL, row * CELL))
    path.parent.mkdir(parents=True, exist_ok=True)
    out.save(path)
    print("wrote", path.relative_to(ROOT))


SHEETS = {
    # example mod            colour (body, rim)
    "02-new-creep": ((120, 220, 140, 255), (40, 110, 60, 255)),      # green
    "03-behaviour": ((90, 200, 255, 255), (25, 90, 140, 255)),       # cyan  — the kiter
    "03-behaviour-b": ((255, 175, 60, 255), (150, 85, 10, 255)),     # amber — the orbiter
}

if __name__ == "__main__":
    sheet(ROOT / "examples/02-new-creep/assets/mods/example/blob.png", *SHEETS["02-new-creep"])
    sheet(ROOT / "examples/03-behaviour/assets/mods/example/skirmisher.png", *SHEETS["03-behaviour"])
    sheet(ROOT / "examples/03-behaviour/assets/mods/example/circler.png", *SHEETS["03-behaviour-b"])
