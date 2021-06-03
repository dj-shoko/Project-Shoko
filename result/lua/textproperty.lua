local module = {}

module.font = {
  {id = 0, path = "../fonts/MPLUSRounded1c-Regular.ttf", type = 1},
}

bpmmin = main_state.number(91)
bpmmax = main_state.number(90)
songmin = main_state.number(1163)
songsec = main_state.number(1164)

local diff_str = nil
if main_state.option(151) then
  diff_str = "Beginner"
elseif main_state.option(152) then
  diff_str = "Normal"
elseif main_state.option(153) then
  diff_str = "Hyper"
elseif main_state.option(154) then
  diff_str = "Another"
elseif main_state.option(155) then
  diff_str = "Insane"
elseif main_state.option(150) then
  diff_str = "Unknown"
end

local level_str = main_state.text(1002)
local star_str = "☆"
if main_state.option(155) then star_str = "★" end

if "" == level_str then level_str = star_str .. main_state.number(96) end

gauge = main_state.number(107)
gaugedec = main_state.number(407)
gaugetext_str = gauge .. "." .. gaugedec .. "%"

if main_state.number(1163) == main_state.number(1164) then
  bpm_str = bpmmin .. "-" .. bpmmax
else
  bpm_str = main_state.number(92)
end

if songsec < 10 then
  duration_str = songmin .. ":" .. "0" .. songsec
else
  duration_str = songmin .. ":" .. songsec
end

module.text = {
  {id = "titlefull",	font = 0, size = 48, align = 1, constantText = main_state.text(12)},
  {id = "level",	font = 0, size = 48, align = 0, constantText = diff_str .. " " .. level_str},
  {id = "gaugetext",	font = 0, size = 48, align = 0, constantText = gaugetext_str},
  --{id = "table",	font = 0, size = 48, align = 1, constantText = table_str},

  {id = "title",	font = 0, size = 48, align = 2, overflow = 1, constantText = main_state.text(10)},
  {id = "artist",	font = 0, size = 48, align = 2, overflow = 1, constantText = main_state.text(14)},
  {id = "bpm",	font = 0, size = 48, align = 2, overflow = 1, constantText = bpm_str},
  {id = "duration",	font = 0, size = 48, align = 2, overflow = 1, constantText = duration_str},
  {id = "notes",	font = 0, size = 48, align = 2, overflow = 1, constantText = main_state.number(106)},
  {id = "total",	font = 0, size = 48, align = 2, overflow = 1, constantText = main_state.number(368)},

  {id = "judge0",	font = 0, size = 48, align = 2, overflow = 1, constantText = "Very Hard"},
  {id = "judge1",	font = 0, size = 48, align = 2, overflow = 1, constantText = "Hard"},
  {id = "judge2",	font = 0, size = 48, align = 2, overflow = 1, constantText = "Normal"},
  {id = "judge3",	font = 0, size = 48, align = 2, overflow = 1, constantText = "Easy"},
  {id = "judge4",	font = 0, size = 48, align = 2, overflow = 1, constantText = "Very Easy"},
}

return module
