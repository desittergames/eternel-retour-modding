# Reference

**Generated from the game's own config classes — do not edit by hand.**

Every key the game accepts, its type, and what it falls back to when you leave it out. This
is the exhaustive list; the [guide](README.md) explains what to do with it.

A key marked **(required)** has no default: leave it out and the file won't load.

## Accepted values

| setting | values |
|---|---|
| `behavior` | `CHASER` · `KITER` · `ORBITER` |
| `action (boss phases)` | `RING` · `RING_AT_PLAYER` · `FAN` · `RADIAL` · `TWIN_GUNS` · `ADDS` |
| `trigger (item hooks)` | `KILL` · `HIT` · `CRIT` |
| `effect (item hooks)` | `EXPLODE` · `ARC` · `SCRIPT` |
| `delivery (attacks)` | `MELEE` · `HITSCAN` · `PROJECTILE` |
| `stat (item effects)` | `MOVE_SPEED` · `MAX_HEALTH` · `MAGNET` · `XP_GAIN` · `DAMAGE` · `ATTACK_SPEED` · `CRIT_CHANCE` · `CRIT_DAMAGE` · `REGEN` · `AREA` · `ARMOR` · `PIERCE` · `MULTISHOT` · `OMNIVAMP` · `BURN` · `BLEED` · `ORBITER` · `TURRETS` · `WELL_DAMAGE` · `SKILL_POWER` · `SKILL_SIZE` · `SKILL_HASTE` · `SKILL_DURATION` · `KNOCKBACK` |

## combat.yaml

### `creeps.<id>`

One entry per creep. A **new** id adds a creep; an existing one changes it.

| key | type | default |
|---|---|---|
| `attacks` | `list` | `[]` |
| `maxHealth` | `whole number` | `12` |
| `aggroRadius` | `number` | `6.0` |
| `wanderRadius` | `number` | `2.5` |
| `wanderSpeed` | `number` | `1.2` |
| `chaseSpeed` | `number` | `3.0` |
| `attackRange` | `number` | `1.2` |
| `xpValue` | `whole number` | `1` |
| `killValue` | `number` | `1.0` |
| `radius` | `number` | `0.5` |
| `scale` | `number` | `1.0` |
| `color` | `text` | `""` |
| `behavior` | `CreepBehavior` | `CHASER` |
| `preferredRange` | `number` | `0.0` |
| `boss` | `true / false` | `false` |
| `explosionDamage` | `whole number` | `0` |
| `explosionRadius` | `number` | `0.0` |
| `flying` | `true / false` | `false` |
| `waterSlowFactor` | `number` | `0.5` |
| `waterSpawnBias` | `number` | `0.0` |
| `eliteOf` | `text` | `""` |
| `eliteTier` | `whole number` | `0` |
| `codex` | `true / false` | `true` |

### `creeps.<id>.attacks[]`

| key | type | default |
|---|---|---|
| `attack` | `text` **(required)** | — |
| `priority` | `whole number` **(required)** | — |

### `attacks.<id>`

Referenced by creeps and bosses. Note `chargeSpeed`: an attack with one **lunges** at the player during its wind-up, which overrides stand-off `behavior`.

| key | type | default |
|---|---|---|
| `delivery` | `AttackDelivery` **(required)** | — |
| `damage` | `whole number` **(required)** | — |
| `damageType` | `DamageType` **(required)** | — |
| `range` | `number` **(required)** | — |
| `arc` | `number` | — |
| `cooldown` | `duration, e.g. `"1500ms"` / `"2s"`` **(required)** | — |
| `windup` | `duration, e.g. `"1500ms"` / `"2s"`` | — |
| `cooldownGroup` | `text` | — |
| `gcd` | `true / false` | — |
| `knockback` | `true / false` | — |
| `projectile` | `ProjectileSpec` | — |
| `chargeSpeed` | `number` | — |
| `visual` | `text` | — |
| `beamWidth` | `number` | — |

### `bossVariants.<id>`

Authoring `phases` replaces the boss's built-in script entirely.

| key | type | default |
|---|---|---|
| `introDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `2s` |
| `pullRadius` | `number` | `30.0` |
| `creepPullSpeed` | `number` | `9.0` |
| `playerPullSpeed` | `number` | `2.2` |
| `slamCoreRadius` | `number` | `3.5` |
| `slamRadius` | `number` | `8.0` |
| `slamDamage` | `whole number` | `100` |
| `slamEdgeDamage` | `whole number` | `18` |
| `slamMinDamage` | `whole number` | `8` |
| `landDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `deathDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.2s` |
| `hitboxX` | `number` | `0.0` |
| `hitboxY` | `number` | `0.0` |
| `phases` | `list` | `[]` |
| `phase1Duration` | `duration, e.g. `"1500ms"` / `"2s"`` | `7s` |
| `phase2Duration` | `duration, e.g. `"1500ms"` / `"2s"`` | `7s` |
| `strafeSpeed` | `number` | `4.0` |
| `strafeRepick` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.8s` |
| `strafeRadius` | `number` | `10.0` |
| `chargeInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `4.5s` |
| `chargeWindup` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `chargeSpeed` | `number` | `18.0` |
| `chargeDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `chargeDamage` | `whole number` | `20` |
| `ringInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.4s` |
| `ringThrow` | `duration, e.g. `"1500ms"` / `"2s"`` | `450ms` |
| `ringWindup` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `ringStep` | `number` | `3.5` |
| `ringCount` | `whole number` | `4` |
| `ringStepInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `280ms` |
| `ringBandWidth` | `number` | `1.6` |
| `ringDamage` | `whole number` | `12` |
| `ringsPerCycle` | `whole number` | `1` |
| `playerRingEvery` | `whole number` | `2` |
| `ringSpawnRadius` | `number` | `12.0` |
| `addInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `900ms` |
| `baseAdds` | `whole number` | `6` |
| `addsPerCycle` | `whole number` | `3` |
| `addBatch` | `whole number` | `2` |
| `addCreep` | `text` | `"swarm"` |
| `projectileAttack` | `text` | `"boss_bolt"` |
| `baseFireInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `900ms` |
| `fireIntervalGrowth` | `number` | `0.15` |
| `fanShots` | `whole number` | `2` |
| `radialEvery` | `whole number` | `4` |
| `radialShots` | `whole number` | `12` |
| `gunInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `gunSpacing` | `number` | `1.2` |
| `gammaInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `2.8s` |
| `gammaWindup` | `duration, e.g. `"1500ms"` / `"2s"`` | `350ms` |
| `gammaStart` | `number` | `3.0` |
| `gammaStep` | `number` | `2.6` |
| `gammaChainLen` | `number` | `34.0` |
| `gammaChainDelay` | `duration, e.g. `"1500ms"` / `"2s"`` | `55ms` |
| `gammaLanes` | `whole number` | `2` |
| `gammaLaneGap` | `number` | `2.2` |
| `gammaBand` | `number` | `1.9` |
| `gammaDamage` | `whole number` | `12` |
| `slashDashes` | `whole number` | `2` |
| `slashWindup` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `slashSpeed` | `number` | `24.0` |
| `slashStrike` | `duration, e.g. `"1500ms"` / `"2s"`` | `300ms` |
| `slashOvershoot` | `number` | `12.0` |
| `slashRadius` | `number` | `3.0` |
| `slashDamage` | `whole number` | `20` |
| `summonHp` | `list` | `[0.7, 0.35]` |
| `eliteCount` | `whole number` | `4` |
| `addCreep2` | `text` | `""` |
| `eliteCount2` | `whole number` | `0` |
| `addCreep3` | `text` | `""` |
| `eliteCount3` | `whole number` | `0` |
| `summonTimeout` | `duration, e.g. `"1500ms"` / `"2s"`` | `20s` |
| `barrageInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.1s` |
| `barrageBombs` | `whole number` | `2` |
| `barrageBombsPerCycle` | `whole number` | `1` |
| `spiralEvery` | `whole number` | `3` |
| `slamTelegraph` | `duration, e.g. `"1500ms"` / `"2s"`` | `900ms` |
| `novaWindup` | `duration, e.g. `"1500ms"` / `"2s"`` | `250ms` |
| `turretCount` | `whole number` | `2` |
| `turretCreep` | `text` | `"turret_elite"` |
| `slamAdds` | `list` | `[]` |
| `relocateDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `relocateSpeed` | `number` | `22.0` |
| `flameDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `2.2s` |
| `flameRange` | `number` | `9.0` |
| `flameArc` | `number` | `34.0` |
| `flameTickDamage` | `whole number` | `6` |
| `flameTickInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `200ms` |
| `flameTurnRate` | `number` | `60.0` |
| `flameDeployDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `flameReturnDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `broodInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.2s` |
| `broodAdds` | `list` | `[]` |
| `broodPerCycle` | `whole number` | `1` |
| `burrowHide` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `burrowBurst` | `whole number` | `6` |
| `burrowCreep` | `text` | `"swarm"` |
| `coreNovaInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `4.5s` |
| `burrowVulnMult` | `number` | `2.0` |
| `burrowVulnWindow` | `duration, e.g. `"1500ms"` / `"2s"`` | `2.5s` |
| `acidHp` | `number` | `0.4` |
| `acidDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `8s` |
| `absorbHeal` | `whole number` | `6` |
| `acidTick` | `duration, e.g. `"1500ms"` / `"2s"`` | `500ms` |
| `acidDamage` | `whole number` | `4` |
| `fruitInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `2.6s` |
| `fruitPerWave` | `whole number` | `2` |
| `healAmount` | `whole number` | `30` |
| `boltInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `1.5s` |
| `boltDamage` | `whole number` | `24` |
| `boltRadius` | `number` | `2.2` |
| `boltTelegraph` | `duration, e.g. `"1500ms"` / `"2s"`` | `800ms` |
| `boltPerWave` | `whole number` | `1` |
| `buffTelegraph` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `buffDamageMult` | `number` | `1.6` |
| `castDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `3.8s` |
| `castInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `850ms` |
| `daggerWaves` | `whole number` | `4` |
| `daggerInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `700ms` |
| `daggersPerWave` | `whole number` | `3` |
| `daggerRingRadius` | `number` | `3.5` |
| `daggerRingFlatten` | `number` | `0.45` |
| `daggerRingDrop` | `number` | `5.0` |
| `daggerMax` | `whole number` | `8` |
| `daggerHp` | `whole number` | `14` |
| `daggerSpeed` | `number` | `16.0` |
| `daggerSliceDamage` | `whole number` | `10` |
| `daggerStabDamage` | `whole number` | `14` |
| `daggerStabRadius` | `number` | `1.9` |
| `daggerTeleport` | `duration, e.g. `"1500ms"` / `"2s"`` | `4.2s` |
| `swordDamage` | `whole number` | `26` |
| `swordRadius` | `number` | `2.2` |
| `swordTelegraph` | `duration, e.g. `"1500ms"` / `"2s"`` | `900ms` |
| `swordsPerCast` | `whole number` | `1` |
| `volleyDuration` | `duration, e.g. `"1500ms"` / `"2s"`` | `2.4s` |
| `volleyInterval` | `duration, e.g. `"1500ms"` / `"2s"`` | `550ms` |
| `teleHide` | `duration, e.g. `"1500ms"` / `"2s"`` | `450ms` |
| `zapTelegraph` | `duration, e.g. `"1500ms"` / `"2s"`` | `800ms` |
| `zapRadius` | `number` | `5.5` |
| `zapDamage` | `whole number` | `22` |

### `bossVariants.<id>.phases[]`

| key | type | default |
|---|---|---|
| `label` | `text` | `""` |
| `duration` | `duration, e.g. `"1500ms"` / `"2s"`` | `7s` |
| `actions` | `list` | `[]` |

### `bossVariants.<id>.phases[].actions[]`

| key | type | default |
|---|---|---|
| `action` | `BossAction` **(required)** | — |
| `every` | `duration, e.g. `"1500ms"` / `"2s"`` | — |
| `count` | `whole number` | — |
| `delay` | `duration, e.g. `"1500ms"` / `"2s"`` | — |

### `player`

| key | type | default |
|---|---|---|
| `moveSpeed` | `number` | `12.0` |
| `waterSlowFactor` | `number` | `0.5` |
| `radius` | `number` | `0.5` |
| `hitboxX` | `number` | `-0.5` |
| `hitboxY` | `number` | `0.0` |
| `magnetRadius` | `number` | `3.0` |
| `regenPerSec` | `number` | `0.0` |
| `baseCritChance` | `number` | `0.0` |
| `baseCritMultiplier` | `number` | `1.5` |
| `armorCap` | `number` | `0.8` |
| `dash` | `DashDef` | `DashDef(duration=300ms, speedMultiplier=2.0, iframe=200ms, cooldown=1.2s, pierceRadius=1.5, pierceDamage=8, refundPerEnemy=150ms, refundMaxPerDash=900ms, skillRefundPerEnemy=80ms, skillRefundMaxPerDash=600ms, comboWindow=2.5s, comboMax=5, comboDamageBonus=0.5, endNovaRadius=0.0, endNovaKnockback=0.5)` |
| `orb` | `OrbDef` | `OrbDef(orbitRadius=1.6, spin=6.0, damage=4, hitRadius=0.6, hitCadence=250ms)` |
| `xp` | `XpDef` | `XpDef(baseXp=5, perLevel=4)` |
| `skillShop` | `SkillShopDef` | `SkillShopDef(levels=[5, 12], repeatFrom=20, repeatEvery=10)` |
| `itemShop` | `ItemShopDef` | `ItemShopDef(levels=[2], from=2, every=2)` |
| `draftMomentum` | `number` | `1.0` |
| `draftOptions` | `whole number` | `3` |

## items.yaml

### `items.<id>`

| key | type | default |
|---|---|---|
| `icon` | `text` | `""` |
| `effects` | `list` | `[]` |
| `modes` | `ItemModes` | `ItemModes(weapon=null)` |
| `hooks` | `list` | `[]` |
| `payloads` | `list` | `[]` |
| `artefact` | `true / false` | `false` |
| `prereqs` | `list` | `[]` |
| `prereqMode` | `PrereqMode` | `ALL` |
| `excludes` | `list` | `[]` |
| `draftWeight` | `number` | `1.0` |
| `rarity` | `Rarity` | `COMMON` |
| `tags` | `list` | `[]` |
| `tagWeights` | `map` | `{}` |
| `heroes` | `list` | `[]` |
| `passive` | `true / false` | `false` |
| `demo` | `true / false` | `false` |

### `items.<id>.effects[]`

| key | type | default |
|---|---|---|
| `stat` | `StatKey` **(required)** | — |
| `amount` | `number` **(required)** | — |

### `items.<id>.hooks[]`

With `effect: SCRIPT`, `script` names a Lua function as `"<mod folder>:<function>"`.

| key | type | default |
|---|---|---|
| `effect` | `KillEffectKind` **(required)** | — |
| `trigger` | `HookTrigger` | — |
| `damage` | `number` | — |
| `radius` | `number` | — |
| `script` | `text` | — |

## heroes.yaml

### `heroes.<id>`

Use `startItems+` (with the `+`) to ADD starting items rather than replace them.

| key | type | default |
|---|---|---|
| `icon` | `text` | `""` |
| `anim` | `text` | `"player"` |
| `tint` | `text` | `""` |
| `weapons` | `list` | `[]` |
| `skills` | `list` | `[]` |
| `startItems` | `list` | `[]` |
| `maxHealth` | `whole number` | — |
| `growth` | `GrowthDef` | `GrowthDef(maxHealth=0.0, regen=0.0, armor=0.0, damage=0.0, attackSpeed=0.0, area=0.0, crit=0.0, moveSpeed=0.0, magnet=0.0, skillDamage=0.0, skillSize=0.0, skillHaste=0.0, skillDuration=0.0)` |
| `passiveLimit` | `whole number` | `3` |
| `turretMultishotFraction` | `number` | `0.33333334` |
| `tagWeights` | `map` | `{}` |
| `deny` | `list` | `[]` |
| `id` | `text` | `""` |

## Lua API

Available to scripts under `scripts/`. Everything crosses as plain numbers and text —
there are no live object handles, so a script can't hold on to game state between events.

| call | does |
|---|---|
| `world.damageArea(x, y, radius, amount)` | Damage every enemy within `radius` of a point. `amount` defaults to `world.damage()`. |
| `world.damage()` | This effect's damage, already scaled by the player's Power — so a scripted verb grows with the build. |
| `world.fx(name, x, y, size)` | Play a one-shot visual effect. `name` is any animation entity — the game's, or one your mod ships. Cosmetic only, so a distant client may cull it. |
| `world.log(message)` | Write to the console, prefixed `Mods[lua]:`. The only evidence that survives when an effect is off-screen — put one in early. |

**Not available**, and not configurable: `io`, `os`, the filesystem, the network, processes,
Java interop, `require` outside your own mod, per-frame callbacks, and any UI access.
The interpreter is **Lua 5.2** — no `//` integer division and no bitwise operators (use `bit32`).
