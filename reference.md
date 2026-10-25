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
| `stat (item effects)` | `MOVE_SPEED` · `MAX_HEALTH` · `MAGNET` · `XP_GAIN` · `DAMAGE` · `ATTACK_SPEED` · `CRIT_CHANCE` · `CRIT_DAMAGE` · `REGEN` · `AREA` · `ARMOR` · `PIERCE` · `MULTISHOT` · `OMNIVAMP` · `BURN` · `BLEED` · `ORBITER` · `TURRETS` · `WELL_DAMAGE` · `SKILL_POWER` · `SKILL_SIZE` · `SKILL_HASTE` · `SKILL_DURATION` · `KNOCKBACK` · `BURN_POWER` · `DASH_CHARGES` |
| `type` (spawn `area`) | `ringAroundPlayer` · `fixedPoint` · `rect` · `band` |
| `kind` (wave `events`) | `pack` · `surge` |

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
| `chargeArmor` | `number` | `0.0` |
| `engageJitter` | `number` | `0.0` |
| `maxConcurrentCharges` | `whole number` | `0` |
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
| `cooldown` | `duration, e.g. "1500ms" / "2s"` **(required)** | — |
| `windup` | `duration, e.g. "1500ms" / "2s"` | — |
| `cooldownGroup` | `text` | — |
| `gcd` | `true / false` | — |
| `knockback` | `true / false` | — |
| `projectile` | `ProjectileSpec` | — |
| `muzzle` | `number` | — |
| `chargeSpeed` | `number` | — |
| `chargeRepeats` | `whole number` | — |
| `engageRange` | `number` | — |
| `chargeOvershoot` | `number` | — |
| `chargeTrample` | `true / false` | — |
| `visual` | `text` | — |
| `beamWidth` | `number` | — |

### `bossVariants.<id>`

Authoring `phases` replaces the boss's built-in script entirely.

| key | type | default |
|---|---|---|
| `introDuration` | `duration, e.g. "1500ms" / "2s"` | `2s` |
| `pullRadius` | `number` | `30.0` |
| `creepPullSpeed` | `number` | `9.0` |
| `playerPullSpeed` | `number` | `2.2` |
| `slamCoreRadius` | `number` | `3.5` |
| `slamRadius` | `number` | `8.0` |
| `slamDamage` | `whole number` | `100` |
| `slamEdgeDamage` | `whole number` | `18` |
| `slamMinDamage` | `whole number` | `8` |
| `landDuration` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `deathDuration` | `duration, e.g. "1500ms" / "2s"` | `1.2s` |
| `hitboxX` | `number` | `0.0` |
| `hitboxY` | `number` | `0.0` |
| `phases` | `list` | `[]` |
| `phase1Duration` | `duration, e.g. "1500ms" / "2s"` | `7s` |
| `phase2Duration` | `duration, e.g. "1500ms" / "2s"` | `7s` |
| `strafeSpeed` | `number` | `4.0` |
| `strafeRepick` | `duration, e.g. "1500ms" / "2s"` | `1.8s` |
| `strafeRadius` | `number` | `10.0` |
| `chargeInterval` | `duration, e.g. "1500ms" / "2s"` | `4.5s` |
| `chargeWindup` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `chargeSpeed` | `number` | `18.0` |
| `chargeDuration` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `chargeDamage` | `whole number` | `20` |
| `ringInterval` | `duration, e.g. "1500ms" / "2s"` | `1.4s` |
| `ringThrow` | `duration, e.g. "1500ms" / "2s"` | `450ms` |
| `ringWindup` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `ringStep` | `number` | `3.5` |
| `ringCount` | `whole number` | `4` |
| `ringStepInterval` | `duration, e.g. "1500ms" / "2s"` | `280ms` |
| `ringBandWidth` | `number` | `1.6` |
| `ringDamage` | `whole number` | `12` |
| `ringsPerCycle` | `whole number` | `1` |
| `playerRingEvery` | `whole number` | `2` |
| `ringSpawnRadius` | `number` | `12.0` |
| `addInterval` | `duration, e.g. "1500ms" / "2s"` | `900ms` |
| `baseAdds` | `whole number` | `6` |
| `addsPerCycle` | `whole number` | `3` |
| `addBatch` | `whole number` | `2` |
| `addCreep` | `text` | `"swarm"` |
| `projectileAttack` | `text` | `"boss_bolt"` |
| `baseFireInterval` | `duration, e.g. "1500ms" / "2s"` | `900ms` |
| `fireIntervalGrowth` | `number` | `0.15` |
| `fanShots` | `whole number` | `2` |
| `radialEvery` | `whole number` | `4` |
| `radialShots` | `whole number` | `12` |
| `gunInterval` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `gunSpacing` | `number` | `1.2` |
| `gunMaxOffAimDeg` | `number` | `0.0` |
| `gammaInterval` | `duration, e.g. "1500ms" / "2s"` | `2.8s` |
| `gammaWindup` | `duration, e.g. "1500ms" / "2s"` | `350ms` |
| `gammaStart` | `number` | `3.0` |
| `gammaStep` | `number` | `2.6` |
| `gammaChainLen` | `number` | `34.0` |
| `gammaChainDelay` | `duration, e.g. "1500ms" / "2s"` | `55ms` |
| `gammaLanes` | `whole number` | `2` |
| `gammaLaneGap` | `number` | `2.2` |
| `gammaBand` | `number` | `1.9` |
| `gammaDamage` | `whole number` | `12` |
| `slashDashes` | `whole number` | `2` |
| `slashWindup` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `slashSpeed` | `number` | `24.0` |
| `slashStrike` | `duration, e.g. "1500ms" / "2s"` | `300ms` |
| `slashOvershoot` | `number` | `12.0` |
| `slashMaxRange` | `number` | `13.0` |
| `aimLead` | `number` | `0.0` |
| `aimLeadMax` | `number` | `6.0` |
| `slashRadius` | `number` | `3.0` |
| `slashDamage` | `whole number` | `20` |
| `dotImmune` | `list` | `[]` |
| `summonHp` | `list` | `[0.7, 0.35]` |
| `eliteCount` | `whole number` | `4` |
| `addCreep2` | `text` | `""` |
| `eliteCount2` | `whole number` | `0` |
| `addCreep3` | `text` | `""` |
| `eliteCount3` | `whole number` | `0` |
| `summonTimeout` | `duration, e.g. "1500ms" / "2s"` | `20s` |
| `barrageInterval` | `duration, e.g. "1500ms" / "2s"` | `1.1s` |
| `barrageBombs` | `whole number` | `2` |
| `barrageBombsPerCycle` | `whole number` | `1` |
| `spiralEvery` | `whole number` | `3` |
| `barrageLeadShare` | `number` | `0.0` |
| `slamTelegraph` | `duration, e.g. "1500ms" / "2s"` | `900ms` |
| `novaWindup` | `duration, e.g. "1500ms" / "2s"` | `250ms` |
| `turretCount` | `whole number` | `2` |
| `turretCreep` | `text` | `"turret_elite"` |
| `slamAdds` | `list` | `[]` |
| `relocateDuration` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `relocateSpeed` | `number` | `22.0` |
| `flameDuration` | `duration, e.g. "1500ms" / "2s"` | `2.2s` |
| `flameRange` | `number` | `9.0` |
| `flameArc` | `number` | `34.0` |
| `flameTickDamage` | `whole number` | `6` |
| `flameTickInterval` | `duration, e.g. "1500ms" / "2s"` | `200ms` |
| `flameTurnRate` | `number` | `60.0` |
| `flameDeployDuration` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `flameReturnDuration` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `broodInterval` | `duration, e.g. "1500ms" / "2s"` | `1.2s` |
| `broodAdds` | `list` | `[]` |
| `broodPerCycle` | `whole number` | `1` |
| `burrowHide` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `burrowBurst` | `whole number` | `6` |
| `burrowCreep` | `text` | `"swarm"` |
| `coreNovaInterval` | `duration, e.g. "1500ms" / "2s"` | `4.5s` |
| `burrowVulnMult` | `number` | `2.0` |
| `burrowVulnWindow` | `duration, e.g. "1500ms" / "2s"` | `2.5s` |
| `acidHp` | `number` | `0.4` |
| `acidDuration` | `duration, e.g. "1500ms" / "2s"` | `8s` |
| `absorbHeal` | `whole number` | `6` |
| `acidTick` | `duration, e.g. "1500ms" / "2s"` | `500ms` |
| `acidDamage` | `whole number` | `4` |
| `fruitInterval` | `duration, e.g. "1500ms" / "2s"` | `2.6s` |
| `fruitPerWave` | `whole number` | `2` |
| `healAmount` | `whole number` | `30` |
| `boltInterval` | `duration, e.g. "1500ms" / "2s"` | `1.5s` |
| `boltDamage` | `whole number` | `24` |
| `boltRadius` | `number` | `2.2` |
| `boltTelegraph` | `duration, e.g. "1500ms" / "2s"` | `800ms` |
| `boltPerWave` | `whole number` | `1` |
| `buffTelegraph` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
| `buffDamageMult` | `number` | `1.6` |
| `castDuration` | `duration, e.g. "1500ms" / "2s"` | `3.8s` |
| `castInterval` | `duration, e.g. "1500ms" / "2s"` | `850ms` |
| `daggerWaves` | `whole number` | `4` |
| `daggerInterval` | `duration, e.g. "1500ms" / "2s"` | `700ms` |
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
| `daggerTeleport` | `duration, e.g. "1500ms" / "2s"` | `4.2s` |
| `swordDamage` | `whole number` | `26` |
| `swordRadius` | `number` | `2.2` |
| `swordTelegraph` | `duration, e.g. "1500ms" / "2s"` | `900ms` |
| `swordsPerCast` | `whole number` | `1` |
| `volleyDuration` | `duration, e.g. "1500ms" / "2s"` | `2.4s` |
| `volleyInterval` | `duration, e.g. "1500ms" / "2s"` | `550ms` |
| `teleHide` | `duration, e.g. "1500ms" / "2s"` | `450ms` |
| `zapTelegraph` | `duration, e.g. "1500ms" / "2s"` | `800ms` |
| `zapRadius` | `number` | `5.5` |
| `zapDamage` | `whole number` | `22` |

### `bossVariants.<id>.phases[]`

| key | type | default |
|---|---|---|
| `label` | `text` | `""` |
| `duration` | `duration, e.g. "1500ms" / "2s"` | `7s` |
| `actions` | `list` | `[]` |

### `bossVariants.<id>.phases[].actions[]`

| key | type | default |
|---|---|---|
| `action` | `BossAction` **(required)** | — |
| `every` | `duration, e.g. "1500ms" / "2s"` | — |
| `count` | `whole number` | — |
| `delay` | `duration, e.g. "1500ms" / "2s"` | — |

### `player`

| key | type | default |
|---|---|---|
| `moveSpeed` | `number` | `12.0` |
| `waterSlowFactor` | `number` | `0.5` |
| `radius` | `number` | `0.5` |
| `hitboxX` | `number` | `-0.5` |
| `hitboxY` | `number` | `0.0` |
| `magnetRadius` | `number` | `3.0` |
| `regenPctPerSec` | `number` | `0.0` |
| `leechCapPerMaxHp` | `number` | `0.0` |
| `baseCritChance` | `number` | `0.0` |
| `baseCritMultiplier` | `number` | `1.5` |
| `armorCap` | `number` | `0.8` |
| `armorK` | `number` | `0.0` |
| `armorKPerCreepLevel` | `number` | `0.0` |
| `dash` | `DashDef` | `DashDef(duration=300ms, speedMultiplier=2.0, iframe=200ms, cooldown=1.2s, chargeGap=200ms, pierceRadius=1.5, pierceDamage=8, refundPerEnemy=150ms, refundMaxPerDash=900ms, skillRefundPerEnemy=80ms, skillRefundMaxPerDash=600ms, comboWindow=2.5s, comboMax=5, comboDamageBonus=0.5, endNovaRadius=0.0, endNovaKnockback=0.5)` |
| `gunMuzzleSide` | `number` | `0.65` |
| `gunMuzzleForward` | `number` | `0.34` |
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

## biomes.yaml

Which creeps spawn, and in what rhythm, for one biome. Everything you **don't** write carries
over from the base biome — `phases` and `beats` are lists, so writing either replaces the
biome's wholesale, while `events` is a map and merges by key (you can add one pack without
restating the rest).

### `biomes.<id>`

One entry per biome id (`wasteland`, `blood_forest`, `swamp`, `forest`, `overgrown_temple`, `winter`). Endless/freeplay does not read this file.

| key | type | default | what it does |
|---|---|---|---|
| `area` | `SpawnAreaDef` | `RingAroundPlayer(minRadius=8.0, maxRadius=14.0)` | Where the baseline creep stream puts creeps. An event can override it with its own `area`. |
| `minDuration` | `duration, e.g. "1500ms" / "2s"` | `0s` | Gauge ceiling: the soonest the boss can arrive. For this long the gauge can climb no faster than the clock, so no build can rush the phase spine by killing faster. Your first phase's `until` × this is how long the opener lasts. `"0s"` = off. |
| `maxDuration` | `duration, e.g. "1500ms" / "2s"` | `0s` | Gauge floor: the latest the boss can arrive. The gauge is dragged up to at least `elapsed / this`, so a run that stalls still resolves in a boss fight. `"0s"` = off (no deadline). |
| `thresholdScale` | `number` | `1.0` | Multiplies the level's `bossThreshold` for this biome — how much killing the boss fight costs here. |
| `phases` | `list` | `[]` | The phase spine, in order. Replaces the base biome's wholesale — end it at `until: 1.0`. |
| `events` | `map` | `{}` | Named packs and surges, referenced by a phase's `events.cycle` and by `beats`. Maps MERGE by key, so adding one event here keeps the biome's others. |
| `beats` | `list` | `[]` | Guaranteed set pieces on the gauge (the pre-boss surge and friends). Replaces the base list wholesale. |
| `bossHp` | `number` | `1.0` | Multiplies this biome's boss HP (on top of the usual depth scaling). 1 = as-is. |
| `bossDamage` | `number` | `1.0` | Multiplies this biome's boss outgoing damage. 1 = as-is. |

### `biomes.<id>.phases[]`

The phase spine, in order — the active phase is the first whose `until` the gauge hasn't passed. The last one should be `until: 1.0`. **`mix` here is WEIGHTS**, not counts: `{ a: 3, b: 1 }` means 75% / 25% of whatever the top-up spawns.

| key | type | default | what it does |
|---|---|---|---|
| `until` | `number` **(required)** | — | Gauge fraction (0..1) this phase runs up to. The last phase should be `1.0`. |
| `mix` | `map` | — | Creep id → **weight** (not a count): `{ a: 3, b: 1 }` is 75% / 25% of whatever the refill spawns. |
| `alive` | `whole number` | — | How many of these creeps are alive around you at once — a POPULATION, not a spawn rate. The director tops the field back up to it as you kill. |
| `refillEvery` | `duration, e.g. "1500ms" / "2s"` | — | How often the top-up happens. |
| `refillBatch` | `whole number` | — | Most creeps one top-up may add. This over `refillEvery` is the fastest anyone can kill here, so it also sets how quickly the best build can reach the boss. |
| `events` | `EventSchedule` | — | The pack/surge rhythm for this phase. Leave it out for no scheduled threats. |
| `label` | `text` | — | Name shown on the HUD timeline when the phase starts. Blank = not shown. |
| `creepHp` | `number` | — | Multiplies the HP of creeps spawned during this phase (on top of the creep level). 1 = as-is. |
| `creepDamage` | `number` | — | Multiplies the outgoing damage of creeps spawned during this phase. 1 = as-is. |

### `biomes.<id>.phases[].events`

This phase's threat rhythm: the named events fire in order on the phase's own clock, then wrap.

| key | type | default | what it does |
|---|---|---|---|
| `every` | `duration, e.g. "1500ms" / "2s"` | `0s` | Gap between events. The first one lands this long after the phase starts. |
| `cycle` | `list` | `[]` | Event names from `events:`, fired in this order, then wrapping round. |

### `biomes.<id>.events.<name>`

A pack (a cluster around one point — a position problem) or a surge (a burst from one direction with a way out — a build problem). **`mix` here is literal COUNTS**, unlike a phase's: `{ boar: 16 }` spawns 16 boars at once. Spawned *above* the phase's `alive` target.

| key | type | default | what it does |
|---|---|---|---|
| `kind` | `WaveEventKind` | `pack` | `pack` (a cluster around one point) or `surge` (a burst from one direction). |
| `mix` | `map` | `{}` | Creep id → **how many** spawn at once. A literal count here, unlike a phase's `mix`. |
| `spread` | `number` | `2.5` | `pack` only: how far (metres) the members scatter from the group's anchor point. |
| `arcDeg` | `number` | `90.0` | `surge` only: how wide (degrees) the arc it pours in from is. Narrower = more of a single lane. |
| `holdArc` | `duration, e.g. "1500ms" / "2s"` | `0s` | `surge` only: how long the normal creep stream keeps coming from that same arc afterwards. |
| `area` | `SpawnAreaDef` | — | Placement just for this event; leave it out to use the biome's `area`. |

### `biomes.<id>.beats[]`

Guaranteed set pieces on the boss gauge — the pre-boss surge and friends. They also show on the HUD timeline.

| key | type | default | what it does |
|---|---|---|---|
| `atGauge` | `number` **(required)** | — | Gauge fraction (0..1) that fires it. It shows on the HUD timeline here too. |
| `event` | `text` **(required)** | — | Which `events:` entry to fire. |

Areas — `area:` takes a `type:` plus that type's own keys:

### `area` · `type: ringAroundPlayer`

The default: a ring centred on the player.

| key | type | default |
|---|---|---|
| `minRadius` | `number` | `8.0` |
| `maxRadius` | `number` | `14.0` |

### `area` · `type: fixedPoint`

| key | type | default |
|---|---|---|
| `x` | `number` **(required)** | — |
| `y` | `number` **(required)** | — |

### `area` · `type: rect`

| key | type | default |
|---|---|---|
| `x` | `number` **(required)** | — |
| `y` | `number` **(required)** | — |
| `width` | `number` **(required)** | — |
| `height` | `number` **(required)** | — |

### `area` · `type: band`

| key | type | default |
|---|---|---|
| `minY` | `number` **(required)** | — |
| `maxY` | `number` **(required)** | — |
| `aheadMin` | `number` | — |
| `aheadMax` | `number` | — |

## Lua API

Available to scripts under `scripts/`. Everything crosses as plain numbers and text —
there are no live object handles, so a script can't hold on to game state between events.

| call | does |
|---|---|
| `world.damageArea(x, y, radius, amount)` | Damage every enemy within `radius` of a point. `amount` defaults to `world.damage()`. |
| `world.damage()` | This effect's damage, already scaled by the player's Power — so a scripted verb grows with the build. |
| `world.fx(name, x, y, size)` | Play a one-shot visual effect. `name` is any animation entity — the game's, or one your mod ships. Cosmetic only, so a distant client may cull it. |
| `world.nearestEnemy(x, y, radius)` | Find the closest live enemy within `radius`. Returns `x, y, distance` — or nothing if there is none, so `if not ex then return end` is the guard. |
| `world.nearestPlayer(x, y)` | Find the closest player. Returns `x, y, distance` — or nothing when no player is alive. |
| `world.countEnemies(x, y, radius)` | How many live enemies are within `radius` of a point. Cheap — use it to scale an effect with the size of the pack. |
| `world.spawn(creepId, x, y)` | Spawn a creep archetype — the game's, or one your mod defines in `combat.yaml`. Returns false if no such id exists, or if the point is outside the level's spawnable area. |
| `world.time()` | Seconds since the run started. Game time, so it does not advance while the game is paused. |
| `world.random(n)` | A random number: `0..1` with no argument, or a whole `1..n` with one. **Seeded from the run**, so a restored checkpoint replays identically — always use this, never Lua's `math.random`. |
| `world.flag(name)` | Remember that something happened, for the rest of the run. Saved with the run, so it survives a checkpoint restore. Prefix your mod's id to avoid clashing with another mod. |
| `world.hasFlag(name)` | Whether `world.flag` set this name earlier in the run. |
| `world.inc(name, by)` | Add to a run-long counter (`by` defaults to 1) and return its new value — the way to build an effect that grows the more it fires. |
| `world.count(name)` | The current value of a `world.inc` counter, or 0. |
| `world.log(message)` | Write to the console, prefixed `Mods[lua]:`. The only evidence that survives when an effect is off-screen — put one in early. |


### HUD calls

Available to scripts under `scripts/client/`, which run on **your own machine's renderer**
rather than in the simulation. A host-shared mod can never contain one.

Registration, while the script loads:

| call | does |
|---|---|
| `hud.register(id, region, draw)` | Add a HUD element. `region` is one of `topLeft`, `topRight`, `bottomLeft`, `bottomRight`. `draw` is called each frame with a `ui` table. The player can toggle your element off, so never rely on it having run. |

The `ui` table, inside a draw function. Coordinates are **relative to your element's own**
**box**, growing down from its top-left — you never learn where that box sits on screen, which
is what lets your element work on any resolution and stack rather than collide with another
mod's.

| call | does |
|---|---|
| `ui.text(x, y, text, color)` | Draw text. `color` is `"RRGGBB"`, or omit for the HUD default. |
| `ui.rect(x, y, w, h, color)` | Draw a filled rectangle — a bar, a backing panel. |
| `ui.width()` | Your element's width. Lay out against this, never against the screen. |
| `ui.height()` | Your element's height. |
| `ui.meter()` | The per-source damage/heal rows: `{ label, damage, heal }`, refreshed ~10 times a second. |
| `ui.time()` | Seconds since the run started. |

**Not available**, and not configurable: `io`, `os`, the filesystem, the network, processes,
Java interop, `require` outside your own mod, per-frame callbacks, and any UI access.
The interpreter is **Lua 5.2** — no `//` integer division and no bitwise operators (use `bit32`).
`string.format` also **ignores float precision**: `%.1f` keeps the surrounding text but not the
rounding, so `string.format("%.1f", 10.334)` gives `10.333999633789062`. Round it yourself with
`math.floor(x * 10) / 10`.
