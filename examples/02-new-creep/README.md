# 02 — A new creep with its own sprite

Adds `blob`: a creep the game has never heard of, with art this mod ships, spawning in the first biome.

The three pieces, and they are always the same three:

| File | Job |
|---|---|
| `config/combat.yaml` | the creep's stats — a **new key**, so it *adds* rather than *changes* |
| `config/animations.yaml` | its sprite sheet, under the entity key `creep_<id>` |
| `config/biomes.yaml` | where it spawns |

Note `image:` points at `mods/example/blob.png`, and the file lives at `assets/mods/example/blob.png`. Keeping
your art under a folder of your own means it can never collide with the game's or another mod's.

> `color:` does nothing for creeps — they draw their sprite's own colours. To recolour, ship a recoloured sheet.
