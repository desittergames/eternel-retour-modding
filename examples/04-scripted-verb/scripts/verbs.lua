-- A behaviour no config can express: five blasts strung out in a line across the kill, falling off with
-- distance. Called with the death position.
--
-- world.damage() is the item's damage ALREADY scaled by the player's Power, so a scripted effect grows with
-- the build exactly like a built-in one.
function shockLine(x, y)
  local base = world.damage()
  for i = -2, 2 do
    local falloff = 1.0 - (math.abs(i) * 0.25)   -- 1.0 at the kill, 0.5 at the ends
    local bx = x + i * 2.2
    world.damageArea(bx, y, 2.4, base * falloff)
    world.fx("fx_gamma_explosion", bx, y, 3.4 * falloff)
  end

  -- Put a log line in early. When an effect happens off-screen, or you are not sure the script ran at all,
  -- this is the only evidence that survives. It prints to the console prefixed `Mods[lua]:`.
  world.log("shockLine at " .. string.format("%.1f, %.1f", x, y) .. " base=" .. base)
end
