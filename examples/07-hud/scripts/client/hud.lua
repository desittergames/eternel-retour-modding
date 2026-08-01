-- A per-source damage meter, drawn by the mod rather than the game.
--
-- The data is already on the wire (the game publishes it at ~10 Hz for its own breakdown), so this needs no
-- new sim data at all -- only the ability to draw, which is what the client script API adds.

hud.register("meter", "topLeft", function(ui)
  -- Each row carries BOTH damage and heal, so a damage meter has to filter: a heal-only source like Regen
  -- would otherwise sit in the list forever showing 0. Deciding that is the mod's business, not the game's.
  local rows = {}
  for _, r in ipairs(ui.meter()) do
    if r.damage > 0 then rows[#rows + 1] = r end
  end

  if #rows == 0 then
    ui.text(0, 0, "no damage yet", "8a8a9a")
    return
  end

  -- Biggest first: a meter sorted by whatever order the wire happened to use is not a meter.
  table.sort(rows, function(a, b) return a.damage > b.damage end)

  ui.text(0, 0, "DAMAGE", "ffd98a")

  local top = rows[1].damage
  if top < 1 then top = 1 end

  for i = 1, math.min(#rows, 6) do
    local r = rows[i]
    local y = i * 14
    -- A bar scaled against the top source, so the shape of the build reads at a glance.
    ui.rect(0, y, (ui.width() - 8) * (r.damage / top), 10, "3a5a8a")
    ui.text(2, y + 2, r.label .. "  " .. math.floor(r.damage), "d8dee9")
  end
end)

-- A second element, in a different region, to prove regions are independent and that a mod can ship more
-- than one readout.
hud.register("clock", "topRight", function(ui)
  -- NOT string.format("%.1f", ...): this interpreter appends the literal text around the number but IGNORES
  -- float precision, so you get 10.333999633789062 rather than 10.3. Round it yourself.
  local tenths = math.floor(ui.time() * 10) / 10
  ui.text(0, 0, tenths .. "s", "8affc1")
end)
