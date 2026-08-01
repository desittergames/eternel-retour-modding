-- Echo of the Swarm — every fourth kill, something claws its way back up.
--
-- The example for the tier-2 world calls: it *asks about* the world, *remembers* across the run, and *acts*.

-- Which breeds can answer. world.random(n) picks one.
local BREEDS = { "swarm", "dust_jumper", "spitter" }

-- Only block a literal pile-up. Tuned the hard way: `6 within 10 units` sounds reasonable and rejects EVERY
-- echo in real play, because a fight is almost always that dense. A guard you never see fire is a mod that
-- silently does nothing — keep the radius tight and log the rejection.
local CROWD_LIMIT = 4
local CROWD_RADIUS = 4.0

-- How far from the player an echo must appear. Not a rejection: kills usually happen right next to you, so
-- refusing when close would also cancel almost everything. Push it out instead.
local SAFE_DISTANCE = 6.0

function echo(x, y)
  -- world.inc returns the NEW total, so the counter and the test on it are one call. It lives in the run's
  -- saved state, so it survives a checkpoint restore.
  local kills = world.inc("echo:kills")
  if kills % 4 ~= 0 then return end

  -- Ask before acting: without this the mod compounds, since every echo becomes a kill becomes another echo.
  local crowd = world.countEnemies(x, y, CROWD_RADIUS)
  if crowd >= CROWD_LIMIT then
    world.log("echo skipped — " .. crowd .. " already within " .. CROWD_RADIUS)
    return
  end

  -- world.nearestPlayer returns THREE values, or nothing at all. Guard on the first.
  -- Rather than cancel when the kill was in the player's face, walk the spawn point outward along the
  -- player→kill direction, so the echo lands behind the body instead of on top of them.
  local sx, sy = x, y
  local px, py, dist = world.nearestPlayer(x, y)
  if px and dist < SAFE_DISTANCE then
    local dx, dy = x - px, y - py
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 0.001 then dx, dy, len = 1.0, 0.0, 1.0 end   -- kill exactly underfoot: pick any direction
    sx = px + dx / len * SAFE_DISTANCE
    sy = py + dy / len * SAFE_DISTANCE
  end

  -- world.random is seeded from the RUN, not the clock. Use it instead of math.random: a restored checkpoint
  -- then replays the same echoes, rather than rolling a different fight than the one you played.
  local breed = BREEDS[world.random(#BREEDS)]

  -- spawn returns false for an unknown id, or a point the level won't take (inside a wall, out of bounds).
  -- Always branch on it — a silent no-op is the hardest kind of mod bug to find.
  if world.spawn(breed, sx, sy) then
    world.fx("fx_gamma_explosion", sx, sy, 2.0)
    world.log("echo #" .. kills .. " -> " .. breed .. " at " .. math.floor(sx) .. "," .. math.floor(sy))

    -- world.flag is a one-shot memory: set once, true for the rest of the run. Prefix it with your mod id so
    -- two mods can't collide on the same name.
    if not world.hasFlag("echo:first") then
      world.flag("echo:first")
      world.log("the swarm answers for the first time this run")
    end
  else
    world.log("echo refused at " .. math.floor(sx) .. "," .. math.floor(sy) .. " (wall or out of bounds)")
  end
end
