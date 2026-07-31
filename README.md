# Modding L'Éternel Retour: Death Gamble

A mod is a folder. It can add creeps, bosses, items, heroes, sprites, sounds, translations and behaviour —
without touching the game's files, without compiling anything, and without the game being rebuilt.

**Start here:** copy an example out of [`examples/`](examples), drop it in your `mods/` folder, and turn it on.

| Example | Shows |
|---|---|
| [01-hello](examples/01-hello) | the smallest possible mod — two files |
| [02-new-creep](examples/02-new-creep) | a new creep with its own sprite sheet |
| [03-behaviour](examples/03-behaviour) | creeps that kite and circle instead of charging |
| [04-scripted-verb](examples/04-scripted-verb) | an item whose effect is written in Lua, with its own name and FX |
| [05-boss-fight](examples/05-boss-fight) | a whole boss fight composed in config |

Every example is a working mod. Fork this repo and edit them.

> **Scope of this page.** This is the guide: layout, rules, worked examples, and the mistakes that cost real
> time. The exhaustive *key → type → default* tables are **generated from the game's own config classes** and
> live in the reference (see [Reference](#reference)) — hand-maintained schema tables rot, and a wrong reference
> is worse than none.

---

## 1. Your first mod in two minutes

Next to the game executable there is a `mods/` folder (the Mods manager can open it for you — see below).
Create this inside it:

```
mods/
  hello-mod/
    mod.yaml
    config/
      combat.yaml
```

`mod.yaml` — the manifest. Every field is optional:

```yaml
name: "Hello Mod"
version: "1.0.0"
description: "Makes grunts enormous."
```

`config/combat.yaml` — your changes, in the same shape as the game's own config:

```yaml
creeps:
  grunt:
    scale: 3.0        # everything else about the grunt is left alone
```

Now start the game → **Options → Mods**, turn `hello-mod` **ON**, and back out. Grunts are enormous.

**Mods are off until you turn them on.** Dropping a folder in never changes your game by itself.

---

## 2. Installing mods

Three ways, all equivalent:

- **Drag** a mod folder or `.zip` onto the game window.
- **Copy** a `.zip` into `mods/` — it is unpacked on the next scan.
- Unzip it into `mods/` yourself.

In the Mods manager, **`O`** (or **`Y`** on a pad, or the folder icon) opens the `mods/` folder. If you add a
mod while the game is running, it appears when you alt-tab back — no need to reopen the panel.

An installed mod always arrives **disabled**. Installing is not the same as agreeing to run it.

---

## 3. Enabling, load order, and applying

The Mods manager lists every mod it found.

| | |
|---|---|
| **Toggle** | `Enter` / `A`, or click the `[ ]` box |
| **Reorder** | `←`/`→`, or drag the row with the mouse |
| **Apply now** | `R` / `X` |
| **Open folder** | `O` / `Y` |

**Order is priority, and later wins.** If two mods change the same thing, the one further down the list wins.

Changes apply when you **return to the save menu** (leaving a run is enough) — or immediately with `R`. You
never have to restart the game.

---

## 4. What goes in a mod

```
mods/my-mod/
  mod.yaml                 manifest
  config/                  YAML overlays — same filenames as the game's config
    combat.yaml            creeps, attacks, bosses, skills
    items.yaml             items and artefacts
    heroes.yaml            heroes, starting items
    biomes.yaml            which creeps spawn where
    animations.yaml        sprite sheets and clips
    campaign.yaml, level.yaml, sfx.yaml, …
  assets/                  your own files, mirroring the game's asset tree
    stranded/sprites/creep/my_creep.png
    audio/sfx/my_sound.ogg
  i18n/                    your text
    strings.xml            English (also the fallback for every language)
    strings_fr.xml         French
  scripts/                 Lua behaviour (optional)
    verbs.lua
```

Nothing is required except `mod.yaml`. Ship only the folders you use.

---

## 5. The merge rules

Your config is **merged into** the game's, not swapped for it. Four rules, and they are the whole model:

**Maps merge by key, recursively.** Set one field, leave everything else alone:

```yaml
creeps:
  grunt:
    maxHealth: 40      # grunt keeps its art, speed, attacks, drops…
```

**A new key adds new content.** This is how you add a creep rather than change one:

```yaml
creeps:
  my_slime:            # a name the game has never heard of
    maxHealth: 35
    attacks: [{ attack: claw, priority: 1 }]
```

**`~` deletes.** A tombstone removes the base entry entirely:

```yaml
creeps:
  spitter: ~           # this creep no longer exists
```

**Lists replace — unless you use `+`.** A plain list wipes what was there; `key+` appends:

```yaml
heroes:
  vanguard:
    startItems: [my_item]     # REPLACES the hero's starting items
    startItems+: [my_item]    # adds to them — and lets other mods add too
```

> Prefer `+` when you mean "also this". Plain replacement silently discards content you never meant to touch,
> and makes your mod incompatible with any other mod extending the same list.

---

## 6. Adding content

### A creep with its own sprite

`config/combat.yaml` — the creep:

```yaml
creeps:
  my_slime:
    maxHealth: 35
    chaseSpeed: 2.2
    attackRange: 1.5
    scale: 2.4
    xpValue: 3
    attacks: [{ attack: claw, priority: 1 }]
```

`config/animations.yaml` — its art. The entity key is `creep_` + the creep's name:

```yaml
entities:
  creep_my_slime:
    sheet: { image: "stranded/sprites/creep/my_slime.png", cellWidth: 26, cellHeight: 21 }
    clips:
      idle:   { from: 0,  to: 4,  fps: 6,  loop: true }
      walk:   { from: 8,  to: 11, fps: 10, loop: true }
      attack: { from: 16, to: 22, fps: 14, loop: false }
      dead:   { from: 24, to: 31, fps: 16, loop: false }
    actions: { IDLE: "idle", MOVE: "walk", WINDUP: "attack", ATTACK: "attack", DEAD: "dead" }
```

…and put the image at `assets/stranded/sprites/creep/my_slime.png`.

> Two things about creep sprites that surprise everyone:
>
> - **`color:` does nothing.** The field exists and is ignored — creeps draw their sprite's own colours. To
>   recolour one, ship a recoloured sheet.
> - **Size comes from `scale`, not your cell dimensions.** Art drawn edge-to-edge in its cell renders much
>   larger than a character sprite of the same `scale`, because character art sits in its cell with margins. If
>   your creep dwarfs the player, pad the art rather than fighting it with `scale`.

Then make it spawn — `config/biomes.yaml`:

```yaml
biomes:
  wasteland:
    phases:
      - until: 0.5
        label: "Slime Tide"
        intensity: 0.6
        mix: { my_slime: 6, grunt: 2 }
```

### How creeps move

`behavior:` chooses the movement:

| | |
|---|---|
| `CHASER` | walks straight at you (the default) |
| `KITER` | holds `preferredRange`, backing off when you close |
| `ORBITER` | closes, then circles instead of converging |

```yaml
creeps:
  my_skirmisher:
    behavior: KITER
    preferredRange: 5.0
    attackRange: 8.0
    attacks: [{ attack: spit, priority: 1 }]
```

> **A stand-off creep needs a ranged attack.** Give a `KITER` a melee attack with `chargeSpeed` (like `claw`)
> and it will lunge at you regardless — charging is what that attack *does*. Give it one whose `range` is
> shorter than `preferredRange` and it will hold position and never fire. The game warns about both; see
> [Troubleshooting](#9-when-something-doesnt-work).

### A boss fight

Bosses normally run a built-in script. Author `phases:` and yours runs instead — a cycle of phases, each firing
its actions on independent timers:

```yaml
bossVariants:
  mech:
    phases:
      - label: "Bombardment"
        duration: "6s"
        actions:
          - { action: RING_AT_PLAYER, every: "1400ms" }
          - { action: RING, every: "900ms", count: 2, delay: "400ms" }
      - label: "Swarm"
        duration: "7s"
        actions:
          - { action: ADDS, every: "2s", count: 5 }
```

Actions: `RING`, `RING_AT_PLAYER`, `FAN`, `RADIAL`, `TWIN_GUNS`, `ADDS`. Use `delay` to stagger actions so they
don't all fire on the same beat — that's the difference between a pattern and a metronome.

> `FAN`, `RADIAL` and `TWIN_GUNS` need the boss to have a `projectileAttack`. Without one they fire nothing,
> silently. The game warns.

### Names and descriptions

`i18n/strings.xml` — merged into the game's text by key, so you only supply your own:

```xml
<resources>
    <string name="item.my_item.name">Shock Line</string>
    <string name="item.my_item.desc">Slain foes erupt in a line of blasts</string>
</resources>
```

Add `strings_fr.xml` for French. English is always merged, so a mod shipping only `strings.xml` still names its
content in every language.

---

## 7. Scripting (Lua)

For behaviour no config can express. **Optional** — most mods never need it.

`scripts/verbs.lua`:

```lua
function shockLine(x, y)
  local base = world.damage()          -- already scaled by the player's Power
  for i = -2, 2 do
    local falloff = 1.0 - (math.abs(i) * 0.25)
    world.damageArea(x + i * 2.2, y, 2.4, base * falloff)
    world.fx("fx_gamma_explosion", x + i * 2.2, y, 3.4 * falloff)
  end
end
```

Attach it to an item in `config/items.yaml`:

```yaml
items:
  my_artefact:
    icon: "shockwave"
    rarity: COMMON
    hooks:
      - { effect: SCRIPT, trigger: KILL, script: "my-mod:shockLine", damage: 60 }
```

`script` is `"<your mod's folder name>:<function name>"`. Triggers: `KILL`, `HIT`, `CRIT`.

### What scripts can do

| | |
|---|---|
| `world.damageArea(x, y, radius, amount)` | damage enemies in a circle |
| `world.damage()` | the verb's damage, already scaled by the player's build |
| `world.fx(name, x, y, size)` | play a visual effect (any animation entity, yours or the game's) |
| `world.log(msg)` | write to the console — your main debugging tool |

### What scripts cannot do

Scripts run **sandboxed**, and this is not configurable:

- **No `io`, no `os`, no filesystem, no network, no processes.** Nothing outside the game.
- **No Java/Kotlin access.**
- **No `require` of files outside your mod.**
- **It's Lua 5.2**, not 5.4 — no integer division `//`, no bitwise operators (use `bit32`), no integer subtype.
- **No per-frame callbacks.** Scripts fire on events, never every tick.
- **No UI or HUD scripting.** Scripts run inside the simulation, not the interface.

A script that crashes, or loops forever, is stopped and *its* mod is muted for the session. The game keeps
running, and other mods are unaffected.

---

## 8. What mods cannot do (yet)

Worth knowing before you plan something:

- **Custom UI / HUD elements**, including damage meters.
- **New stats, new skill types, or new item-effect kinds** — these come from fixed lists you can pick from but
  not extend.
- **New boss *mechanics*** — `phases:` composes the existing set-pieces into new sequences; it can't invent an
  attack that doesn't exist.
- **Replacing art inside the game's packed atlases.** Your mod's *own* files always work.
- **Multiplayer:** the host's mods drive the game. Everyone should install the same set.

---

## 9. When something doesn't work

**Open Options → Mods first.** It tells you two different things:

- **`ERROR`** (red) — the mod failed to load and was **disabled automatically**. Usually broken YAML. The
  detail line names the file and the parser's complaint. Fix it and re-enable to retry.
- **`warning`** — the mod loaded, but something in it almost certainly won't do what you meant (a `KITER` that
  can't shoot; a boss phase that fires nothing). The mod stays **on**; this is advice, not a failure.

**A broken mod never takes the game down**, and never takes another mod with it.

**Check the console output.** Mod problems print with a `Mods:` prefix, and `world.log()` from your scripts
appears as `Mods[lua]:`. When an effect is off-screen or you're not sure a script ran, a log line is the only
evidence that survives — put one in early.

**Common surprises:**

| Symptom | Cause |
|---|---|
| Nothing changed | The mod is off, or you didn't apply — leave the run, or press `R` |
| Creep is the default sprite | No `creep_<name>` entry in `animations.yaml`, or the image path is wrong |
| Creep is enormous / tiny | Size comes from `scale`, **not** your cell size — art drawn edge-to-edge in its cell renders far bigger than a character sprite with margins. Pad the art, or lower `scale` |
| Recolour did nothing | `color:` is ignored for creeps — ship a recoloured sheet |
| A hero lost its starting item | You used `startItems:` (replaces) instead of `startItems+:` (appends) |
| A `KITER` charges you | Its attack has `chargeSpeed` — give it a ranged attack |
| Boss phase does nothing | Projectile actions with no `projectileAttack` on the boss |
| Your item has no name | No `i18n/strings.xml` entry for `item.<id>.name` |
| Two mods fight | Load order — the lower one wins. Reorder them |

---

## Reference

Exhaustive key/type/default tables for every config file, and the full Lua API, are **generated from the game's
own source** each release, so they can't drift from what the game actually accepts. `reference.md` lands here
alongside this guide.

## A note on assets

**Ship art and audio you have the right to distribute.** Don't extract or redistribute the game's bundled
assets — they're licensed to the game, not to mods built on it. Your mod's own files, or assets you're licensed
for, only.

Every image in this repository is generated by [`tools/make_placeholder_sprites.py`](tools/make_placeholder_sprites.py),
which is why the examples look like coloured blobs: they exist to prove the pipeline, not to look good. Replace
them with real art in your own mod.

## Contributing

Corrections and better examples are welcome — open an issue or a PR. Note that the **reference is generated**,
so fixes to it belong in the game's source rather than here; the guide and the examples are hand-written and
directly editable.

## Licence

The examples and documentation are [CC0](LICENSE) — public domain. Copy, paste and adapt them freely; you don't
need to credit anything. This applies to the contents of this repository only, **not** to the game or its
assets.
