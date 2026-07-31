# 03 — Creeps that don't just charge

Two creeps using the `behavior:` vocabulary: a **KITER** that backs away as you close, and an **ORBITER** that
circles you. Both shoot while they move.

```yaml
behavior: KITER
preferredRange: 5.0
attackRange: 8.0
attacks: [{ attack: spit, priority: 1 }]
```

**The one thing to get right:** a stand-off creep needs a *ranged* attack whose reach covers `preferredRange`.

- Give it a charging melee attack (`claw` sets `chargeSpeed`) and it lunges at you anyway — charging is what
  that attack does, and it overrides standing off.
- Give it one that can't reach from where it stands, and it holds position and never fires.

Both mistakes look like "the behaviour is broken" rather than "these two settings disagree", so the game
**warns** about them in *Options → Mods* — the mod keeps working, it just tells you.

`preferredRange` is optional; leave it out and it's derived from `attackRange`.
