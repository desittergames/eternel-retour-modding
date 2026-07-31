# 04 — A scripted item effect

An item that, on every kill, detonates **five blasts in a line** — a shape no config option can express — with
its own visuals and its own name in English and French.

Four pieces:

| File | Job |
|---|---|
| `scripts/verbs.lua` | the behaviour |
| `config/items.yaml` | the item, pointing at the script |
| `config/heroes.yaml` | hands it to you at run start, so testing needs no shop luck |
| `i18n/strings.xml` | its name and description |

```yaml
hooks:
  - { effect: SCRIPT, trigger: KILL, script: "04-scripted-verb:shockLine", damage: 60 }
```

The `script` value is `"<this mod's folder name>:<function name>"`. Triggers are `KILL`, `HIT` and `CRIT`.

**Note `startItems+`, not `startItems`.** The `+` appends; without it you would *replace* the hero's starting
items and silently delete whatever it shipped with.

**Scripts are sandboxed.** No filesystem, no network, no Java, and it's Lua **5.2** (no `//`, no bitwise
operators — use `bit32`). A script that crashes or loops forever is stopped, and only *its* mod is muted; the
game and every other mod carry on. See the main README for the full API.
