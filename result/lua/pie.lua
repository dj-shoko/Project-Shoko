--Pie
local start_angle = 90
local poor_ct   = main_state.number(114)
local bad_ct    = main_state.number(113)
local good_ct   = main_state.number(112)
local great_ct  = main_state.number(111)
local pgreat_ct = main_state.number(110)
local total_notes = main_state.number(106)

local poor_a    = poor_ct
local bad_a     = bad_ct + poor_a
local good_a    = good_ct + bad_a
local great_a   = great_ct + good_a
local pgreat_a  = pgreat_ct + great_ct

local poor      = 360 * (poor_a / total_notes)
local bad       = 360 * (bad_a / total_notes)
local good      = 360 * (good_a / total_notes)
local great     = 360 * (great_a / total_notes)
local pgreat    = 360 * (pgreat_a / total_notes)
for i=0,360,0.5 do
  local color
  if i < poor then
      color = { r = 230, g = 120, b = 120 }
  elseif i < bad then
      color = { r = 230, g = 190, b = 130 }
  elseif i <= good then
      color = { r = 170, g = 230, b = 180 }
  elseif i <= great then
      color = { r = 175, g = 205, b = 235 }
  else
      color = { r = 220, g = 230, b = 235 }
  end
  local angle = start_angle + i
  table.insert(module.destination, {id = "piepiece", op = {921}, filter = 1, dst = {
      { x = playInfoX + 373, y = judgeY + 175, w = 274, h = 14,
        r = color.r, g = color.g, b = color.b,
        angle = angle }
  }})
end
table.insert(module.destination, {id = "pieborder", filter = 1, op = {921}, dst = {{x = playInfoX + 370, y = judgeY + 41, w = 280, h = 280}}})
