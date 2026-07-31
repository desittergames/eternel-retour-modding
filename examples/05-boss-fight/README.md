# 05 — A boss fight written in config

Replaces the first boss's fight with a three-phase cycle: **Bombardment → Suppress → Swarm**, then repeat.

Without `phases:`, a modded boss is only ever a re-skin — new art, stats and timings, but it still fights like
one of the built-in archetypes. With it, you compose the sequence yourself.

```yaml
- label: "Bombardment"
  duration: "6s"
  actions:
    - { action: RING_AT_PLAYER, every: "1400ms" }
    - { action: RING, every: "900ms", count: 2, delay: "400ms" }
```

Each action runs on **its own timer**, which is what lets a phase read as a pattern — rings every 1.4s under a
fan every 0.7s — rather than everything landing on the same beat. Use `delay` to stagger them.

Actions available: `RING`, `RING_AT_PLAYER`, `FAN`, `RADIAL`, `TWIN_GUNS`, `ADDS`.

> `FAN`, `RADIAL` and `TWIN_GUNS` need the boss to have a `projectileAttack`. Without one they fire **nothing**,
> silently — so the game warns you in *Options → Mods*. Likewise `ADDS` needs a valid `addCreep`.

This composes the game's existing set-pieces into new sequences. It can't invent an attack that doesn't exist —
for that you'd want a script.
