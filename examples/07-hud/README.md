# 07 — Drawing on the HUD

A per-source **damage meter**, drawn by a mod. Plus a run clock in another corner, to show that regions are
independent and one mod can ship several readouts.

The data was already there — the game publishes the per-source meter about ten times a second for its own
breakdown — so this adds no sim data at all. The only new thing is the ability to draw.

## How it differs from every other example

Scripts under `scripts/` run in the **simulation**, on the host. Scripts under `scripts/client/` run on **your
own machine's renderer**. The folder is what decides, not a setting — which is also why a mod a co-op host
sends you can never contain one.

```lua
hud.register("meter", "topLeft", function(ui)
  ui.rect(0, y, ui.width() * fraction, 10, "3a5a8a")
  ui.text(2, y + 2, row.label, "d8dee9")
end)
```

## What you get, and what you don't

You **describe**; the game **draws**. There is no batch, no font, no camera — you emit `ui.text` and `ui.rect`
and they are rendered for you.

Coordinates are **relative to your own box**, growing down from its top-left. You never learn where that box is
on screen. That is deliberate: it means your element works on ultrawide, on a Steam Deck, and at any HUD scale
without you testing any of them — and if another mod also asks for `topLeft`, you stack instead of colliding.

Regions: `topLeft`, `topRight`, `bottomLeft`, `bottomRight`.

## Three things worth copying

**Filter the meter yourself.** Every row carries *both* `damage` and `heal`, so a heal-only source like Regen
sits in a damage list showing 0 forever unless you drop it. The game does not decide that for you.

**Round numbers by hand.** `string.format("%.1f", x)` **does not work** here — this interpreter appends the
surrounding text but ignores float precision, so you get `10.333999633789062` instead of `10.3`. Use
`math.floor(x * 10) / 10`.

**Expect to be switched off.** The player can toggle any mod element in the HUD settings, so never treat your
draw function as guaranteed to have run.

## Safety

Same sandbox as sim scripts: no filesystem, no network, no Java. A script that errors or loops forever is
stopped and *its* mod is muted — the HUD and every other mod carry on. An element that emits an absurd number
of draw calls in one frame is capped rather than allowed to grow.
