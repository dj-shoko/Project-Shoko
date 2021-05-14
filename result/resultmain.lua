main_state = require("main_state")

local property = require("lua.mainproperty")

local filepath = {
	{name = "Default Stagefile",			path = "customize/stagefile/*.png"},
	{name = "Result Background (CLEAR AAA)",	path = "customize/bg/aaa/*.png"},
	{name = "Result Background (CLEAR AA)",		path = "customize/bg/aa/*.png"},
	{name = "Result Background (CLEAR A)",		path = "customize/bg/a/*.png"},
	{name = "Result Background (CLEAR)",		path = "customize/bg/clear/*.png"},
	{name = "Result Background (FAILED)",		path = "customize/bg/failed/*.png"},
}

local header = {
	type = 7,
	name = "Project Shoko Result",
	w = 2560,
	h = 1440,
	scene = 3600000,
	input = 500,
	fadeout = 500,
	property = property.property,
	filepath = filepath
}

local function main()
	local textproperty = require("lua.textproperty")
	local imageproperty = require("lua.imageproperty")
	local valueproperty = require("lua.valueproperty")
	local graph = require("lua.graph")

	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	skin.source = {
		{id = "parts",	path = "parts.png"},
		{id = "groove", path = "groove.png"},
		{id = "grade", path = "customize/grade/default.png"},
		{id = "stagefile",	path = "customize/stagefile/*.png"},
		{id = "bg_aaa",	path = "customize/bg/aaa/*.png"},
		{id = "bg_aa",	path = "customize/bg/aa/*.png"},
		{id = "bg_a",	path = "customize/bg/a/*.png"},
		{id = "bg_c",	path = "customize/bg/clear/*.png"},
		{id = "bg_f",	path = "customize/bg/failed/*.png"},
	}

	skin.font = textproperty.font
	skin.text = textproperty.text
	skin.image = imageproperty.image
	skin.value = valueproperty.value
	skin.gaugegraph = graph.gaugegraph
	skin.judgegraph = graph.judgegraph
	skin.timingdistributiongraph = graph.timingdistributiongraph

	--Commonly used variable values
	local function diffRGB()
		if main_state.option(151) then
			return {113, 255, 168}
		elseif main_state.option(152) then
			return {121, 215, 255}
		elseif main_state.option(153) then
			return {255, 187, 71}
		elseif main_state.option(154) then
			return {189, 95, 103}
		elseif main_state.option(155) then
			return {159, 128, 255}
		elseif main_state.option(150) then
			return {205, 205, 205}
		end
	end

	local timingX = 2500
	local playerX = 60
	local playInfoX = 1776
	local songInfoX = 60
	local RGB = diffRGB()

	if skin_config.option["Play Side"] == 900 then
		timingX = 60
		playerX = 2500
		playInfoX = 60
		songInfoX = 1776
	end

	local judgeY = 162
	local clearY = 550
	local songY = 400
	local levelY = 1053
	local gaugeY = 1047

	local avg_timing	= main_state.number(374) + (main_state.number(375) * 0.01)
	local std_dev	= main_state.number(376) + (main_state.number(377) * 0.01)
	local avg_str	= nil
	if avg_timing < 0 then
	  avg_timing = avg_timing * -1
	  avg_str = "Avg " .. avg_timing .. " ms"
	else
	  avg_str = "Avg " .. avg_timing .. " ms"
	end
	local std_str = "Stdev " .. std_dev .. " ms"

	local playerid_str = "Current Player: ".. main_state.text(2)

	--local ir_str = "Internet Ranking " .. main_state.number(179) .. "/" .. main_state.number(180)
	--IR ranking for previously played song

	if skin_config.option["Play Side"] == 900 then
	  table.insert(skin.text, {id = "avg",	font = 0, size = 24, align = 0, constantText = avg_str})
	  table.insert(skin.text, {id = "std",	font = 0, size = 24, align = 0, constantText = std_str})
	  table.insert(skin.text, {id = "player",	font = 0, size = 24, align = 2, constantText = playerid_str})
	 	--table.insert(skin.text, {id = "ir",	font = 0, size = 24, align = 2, constantText = ir_str})
	  table.insert(skin.text, {id = "offline",	font = 0, size = 48, align = 2, constantText = "NETWORK OFFLINE"})
	else
	  table.insert(skin.text, {id = "avg",	font = 0, size = 24, align = 2, constantText = avg_str})
	  table.insert(skin.text, {id = "std",	font = 0, size = 24, align = 2, constantText = std_str})
	  table.insert(skin.text, {id = "player",	font = 0, size = 24, align = 0, constantText = playerid_str})
	  table.insert(skin.text, {id = "ir",	font = 0, size = 24, align = 0, constantText = ir_str})
	  table.insert(skin.text, {id = "offline",	font = 0, size = 48, align = 0, constantText = "NETWORK OFFLINE"})
	end

	skin.destination = {
		--Background
		{id = "bg_c", op = {90}, dst = {{x = 0, y = 0, w = 2560, h = 1440}}},
		{id = "bg_aaa", op = {90,300}, dst = {{x = 0, y = 0, w = 2560, h = 1440}}},
		{id = "bg_aa", op = {90,301}, dst = {{x = 0, y = 0, w = 2560, h = 1440}}},
		{id = "bg_a", op = {90,302}, dst = {{x = 0, y = 0, w = 2560, h = 1440}}},
		{id = "bg_f", op = {91}, dst = {{x = 0, y = 0, w = 2560, h = 1440}}},

		--Scenery
		{id = "stage", filter = 1, dst = {{x = 1009, y = 1350, w = 542, h = 85}}},
		{id = "titlebox", filter = 1, dst = {{x = 0, y = 0, w = 2560, h = 70}}},
		{id = "titlefull",	filter = 1,	dst = {{x = 1280, y = 6, h = 48, r = 221, g = 229, b = 237}}},

		--Timing Info
		{id = "avg",	filter = 1,	dst = {{x = timingX, y = 36, h = 24, r = 221, g = 229, b = 237}}},
		{id = "std",	filter = 1,	dst = {{x = timingX, y = 6, h = 24, r = 221, g = 229, b = 237}}},

		--IR Info
		{id = "player", op = {51},	filter = 1,	dst = {{x = playerX, y = 36, h = 24, r = 221, g = 229, b = 237}}},
		--{id = "ir", op = {51},	filter = 1,	dst = {{x = playerX, y = 6, h = 24, r = 221, g = 229, b = 237}}},
		{id = "offline", op = {50},	filter = 1,	dst = {{x = playerX, y = 6, h = 48, r = 221, g = 120, b = 120}}},

		--Gauge Area
		{id = "graphbox", filter = 1, dst = {{x = playInfoX, y = gaugeY - 59, w = 724, h = 420}}},
		{id = "gaugeborder", dst = {{x = playInfoX + 18, y = gaugeY, w = 688, h = 342}}},
		{id = "gaugegraph", blend = 2, dst = {{x = playInfoX + 20, y = gaugeY + 2, w = 684, h = 338}}},
		{id = "judgegraph_timing", blend = 2, dst = {{x = playInfoX + 20, y = gaugeY + 2, w = 684, h = 338}}},
		{id = "gaugetext",	filter = 1, dst = {{x = playInfoX + 20, y = gaugeY - 59, h = 48, r = 221, g = 229, b = 237}}},
		{id = "levelbox", filter = 1, dst = {{x = playInfoX + 25, y = levelY + 1, w = 675, h = 60, r = RGB[1], g = RGB[2], b = RGB[3]}}},
		{id = "level",	filter = 1, dst = {{x = playInfoX + 38, y = levelY, h = 48, r = RGB[1], g = RGB[2], b = RGB[3]}}},

		--Clear Info Area
		{id = "clearinfobox", filter = 1, dst = {{x = playInfoX, y = clearY - 26, w = 724, h = 467}}},
		{id = "clearinfo", filter = 1, dst = {{x = playInfoX + 25, y = clearY - 8, w = 262, h = 386}}},

		--Song Info
		{id = -100, op = {910,191}, stretch = 1, filter = 1, dst = {{x = songInfoX + 5, y = songY + 427, w = 714, h = 536}}},
		{id = "stagefile", op = {910,190}, stretch = 1, filter = 1, dst = {{x = songInfoX + 5, y = songY + 427, w = 714, h = 536}}},
		{id = "stagefileborder", op = {910}, stretch = 1, filter = 1, dst = {{x = songInfoX, y = songY + 422, w = 724, h = 546}}},

		{id = "songinfobox", filter = 1, dst = {{x = songInfoX, y = songY - 256, w = 724, h = 602}}},
		{id = "title", filter = 1, dst = {{x = songInfoX + 700, y = songY + 288 - 12, w = 540, h = 48, r = 221, g = 229, b = 237}}},
		{id = "artist", filter = 1, dst = {{x = songInfoX + 700, y = songY + 240 - 12, w = 540, h = 48, r = 221, g = 229, b = 237}}},
		{id = "bpm", filter = 1, dst = {{x = songInfoX + 700, y = songY + 192 - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}},
		{id = "duration", filter = 1, dst = {{x = songInfoX + 700, y = songY + 144 - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}},
		{id = "notes", filter = 1, dst = {{x = songInfoX + 700, y = songY + 96 - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}},
		{id = "total", filter = 1, dst = {{x = songInfoX + 700, y = songY + 48 - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}},

		{id = "timingdistributiongraph", dst = {{x = songInfoX + 24, y = songY - 190, w = 676, h = 175}}},

		--Clear
		{id = "bestclear",	loop = 200, dst = {{time = 0, x = playInfoX + 283, y = clearY + 340,	w = 202, h = 31, a = 0},{time = 200, a = 255}}}, --best
		{id = "clear",	loop = 200, dst = {{time = 0, x = playInfoX + 507, y = clearY + 340,	w = 202, h = 31, a = 0},{time = 200, a = 255}}}, --current

		--Score
		{id = "bestscore",		loop = 200, dst = {{time = 0, x = playInfoX + 320,		y = clearY + 205,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "currentscore",		loop = 200, dst = {{time = 0, x = playInfoX + 548,		y = clearY + 205,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "diffscore",	loop = 200, dst = {{time = 0, x = playInfoX + 570,	y = clearY + 185,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},

		--Combo
		{id = "bestcombo",		loop = 200, dst = {{time = 0, x = playInfoX + 320,		y = clearY+ 136, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "currentcombo",		loop = 200, dst = {{time = 0, x = playInfoX + 548,		y = clearY+ 136, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "diffcombo",	loop = 200, dst = {{time = 0, x = playInfoX + 570,	y = clearY + 117,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},

		--Miss
		{id = "bestmiss",		loop = 200, dst = {{time = 0, x = playInfoX + 320,	y = clearY + 68,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "currentmiss",		loop = 200, dst = {{time = 0, x = playInfoX + 548,	y = clearY + 68,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "diffmiss",	loop = 200, dst = {{time = 0, x = playInfoX + 570,	y = clearY + 49,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},

		--Target
		{id = "target",		loop = 200, dst = {{time = 0, x = playInfoX + 320,		y = clearY, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "difftarget",		loop = 200, dst = {{time = 0, x = playInfoX + 530,		y = clearY, w = 32, h = 37, a = 0},{time = 200, a = 255}}},

		--Score Rate
		{id = "bestrate",	loop = 200, dst = {{time = 0, x = playInfoX + 331,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		{id = "rateperiod",			loop = 200, dst = {{time = 0, x = playInfoX + 377,	y = clearY + 253,	w = 10, h = 18, a = 0},{time = 200, a = 255}}}, --best
		{id = "bestratedec",	loop = 200, dst = {{time = 0, x = playInfoX + 387,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		{id = "ratepercent",		loop = 200, dst = {{time = 0, x = playInfoX + 418,	y = clearY + 253,	w = 21, h = 19, a = 0},{time = 200, a = 255}}}, --best
		{id = "currentrate",	loop = 200, dst = {{time = 0, x = playInfoX + 557,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		{id = "rateperiod",			loop = 200, dst = {{time = 0, x = playInfoX + 603,	y = clearY + 253,	w = 10, h = 18, a = 0},{time = 200, a = 255}}}, --current
		{id = "currentratedec",	loop = 200, dst = {{time = 0, x = playInfoX + 613,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		{id = "ratepercent",		loop = 200, dst = {{time = 0, x = playInfoX + 644,	y = clearY + 253,	w = 21, h = 19, a = 0},{time = 200, a = 255}}}, --current

		--Judge Info Area
		{id = "judgeinfobox", filter = 1, dst = {{x = playInfoX, y = judgeY - 18, w = 724, h = 360}}},
		{id = "judgeinfo", filter = 1, dst = {{x = playInfoX + 24, y = judgeY + 48, w = 151, h = 275}}},
		{id = "cbbox", filter = 1,  dst = {{x = playInfoX + 144, y = 77, w = 580, h = 59}}}, --Combo Break Box

		--Static Text
		{id = "current", filter = 1, dst = {{x = playInfoX + 537, y = clearY + 393, w = 140, h = 44}}},
		{id = "best", filter = 1,  dst = {{x = playInfoX + 306, y = clearY + 385, w = 160, h = 52}}},
		{id = "fs", filter = 1, dst = {{x = playInfoX + 68, y = judgeY, w = 108, h = 36}}},
		{id = "sl", filter = 1, dst = {{x = playInfoX + 379, y = judgeY, w = 108, h = 36}}},

		--Timing
		{id = "ep",	loop = 200, dst = {{time = 0, x = playInfoX + 196, y = judgeY + 48, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "epf", op = {920},	loop = 200, dst = {{time = 0, x = playInfoX + 363, y = judgeY + 48, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "eps", op = {920},	loop = 200, dst = {{time = 0, x = playInfoX + 528, y = judgeY + 48, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "fast",	loop = 200, dst = {{time = 0, x = playInfoX + 196, y = judgeY, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "slow",	loop = 200, dst = {{time = 0, x = playInfoX + 528, y = judgeY, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "cbtext",	loop = 200, dst = {{time = 0, x = playInfoX + 182, y = 89, w = 306, h = 36, a = 0},{time = 200, a = 255}}},
		{id = "cb",	loop = 200, dst = {{time = 0, x = playInfoX + 528, y = 89, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
	}

	--Timing if pie isn't chosen, even though pie isn't even available
	for i = 0, 4 do
		table.insert(skin.destination, {id = "jg"..i,	loop = 200, dst = {{time = 0, x = playInfoX + 196, y = judgeY + 288 - 48 * i, w = 32, h = 37, a = 0},
		{time = 200, a = 255}}})
		table.insert(skin.destination, {id = "jgf"..i, op = {920},	loop = 200, dst = {{time = 0, x = playInfoX + 363, y = judgeY + 288 - 48 * i, w = 32, h = 37, a = 0},
		{time = 200, a = 255}}})
		table.insert(skin.destination, {id = "jgs"..i, op = {920},	loop = 200, dst = {{time = 0, x = playInfoX + 528, y = judgeY + 288 - 48 * i, w = 32, h = 37, a = 0},
		{time = 200, a = 255}}})
	end

	--Grades
	for i = 0, 7 do
		table.insert(skin.destination, {id = "gradesmall"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = playInfoX + 560, y = clearY + 272,	w = 101, h = 38, a = 0},
		{time = 200, a = 255}}}) --current
		table.insert(skin.destination, {id = "gradesmall"..i,	loop = 200, op = {320 + 1 * i}, dst = {{time = 0, x = playInfoX + 332, y = clearY + 272,	w = 101, h = 38, a = 0},
		{time = 200, a = 255}}}) --best
		table.insert(skin.destination, {id = "gradelarge"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = playInfoX + 34, y = 1144,	w = 415, h = 178, a = 0},
		{time = 200, a = 255}}}) --big
	end

	--Judges
	for i = 0, 4 do
		table.insert(skin.destination, {id = "judge"..i, filter = 1, op = {180 + 1 * i}, dst = {{x = songInfoX + 700, y = songY - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}})
	end

	return skin
end

return {
	header = header,
	main = main
}
