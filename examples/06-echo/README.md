# 06 — Reading and changing the world

Example 04 showed a script that *acts* — it detonated blasts and that was all it could do. This one **asks the
world questions, remembers answers across the run, and spawns**.

**Echo of the Swarm**: every fourth kill, a creep claws its way back up where the body fell.

| Call | Used for |
|---|---|
| `world.inc(name)` | counting kills — returns the new total, so the counter and the test on it are one call |
| `world.countEnemies(x, y, r)` | not piling echoes on top of each other |
| `world.nearestPlayer(x, y)` | pushing the spawn away from you — returns **three** values, or nothing |
| `world.random(n)` | picking a breed |
| `world.spawn(id, x, y)` | the actual creep |
| `world.flag` / `world.hasFlag` | a one-shot "this happened once this run" |

## Three things worth copying

**Branch on `world.spawn`.** It returns false for an id no config defines, and for a point the level won't
take — inside a wall, or outside the arena. A spawn that silently didn't happen is the hardest kind of mod bug
to find, so the `else` branch logs.

**Use `world.random`, never `math.random`.** It is seeded from the *run*, so a restored checkpoint replays the
same echoes instead of rolling a different fight than the one you played.

**Prefix your flags and counters** (`echo:kills`, not `kills`). Two mods sharing a name would silently share
state.

## The mistake this example was built on

The first version guarded with `countEnemies(x, y, 10) >= 6` and rejected **every single echo** — a fight is
almost always that dense. The mod loaded, the script ran, nothing ever happened.

That is the characteristic modding failure: config and script that are individually valid and collectively
useless, with no error anywhere. The only reason it was caught is that **every branch logs**, so the console
said `echo skipped — already 6 nearby` nineteen times instead of staying silent.

Log every rejection while you are building. Delete the logs later, if ever.

## Running it

Copy this folder into `mods/`, enable it in **Options → Mods**, and start a run — `config/heroes.yaml` hands
the artefact to the Vanguard at run start (`startItems+`, which **appends**; plain `startItems:` would replace
the hero's own items), so testing needs no shop luck.

Then watch the console, not just the screen.
