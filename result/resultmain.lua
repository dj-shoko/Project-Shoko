main_state = require("main_state")

local flag_rate_up = true

local PROPERTY_OP = 899

local function get_property_op()
	PROPERTY_OP = PROPERTY_OP + 1
	return PROPERTY_OP
end

local RESULT_L		= get_property_op()
local RESULT_R		= get_property_op()
local GRAPH_OFF		= get_property_op()
local GRAPH_ON		= get_property_op()
local STAGEFILE_OFF	= get_property_op()
local STAGEFILE_ON	= get_property_op()

local property = {
	{name = "Play Side", item = {
		{name = "1P", op = RESULT_L},
		{name = "2P", op = RESULT_R}
	}},
	{name = "Display Gauge Graph", item = {
		{name = "OFF", op = GRAPH_OFF},
		{name = "ON", op = GRAPH_ON}
	},def = "ON"},
	{name = "Use Stage File for Background", item = {
		{name = "OFF", op = STAGEFILE_OFF},
		{name = "ON", op = STAGEFILE_ON}
	}},
}

local filepath = {
	{name = "Result Background (CLEAR AAA)",	path = "../customize/resultbg/aaa/*.png"},
	{name = "Result Background (CLEAR AA)",		path = "../customize/resultbg/aa/*.png"},
	{name = "Result Background (CLEAR A)",		path = "../customize/resultbg/a/*.png"},
	{name = "Result Background (CLEAR)",			path = "../customize/resultbg/clear/*.png"},
	{name = "Result Background (FAILED)",			path = "../customize/resultbg/failed/*.png"},
}

local header = {
	type = 7,
	name = "m_select_result (lua)",
	w = 1920,
	h = 1080,
	scene = 3600000,
	input = 500,
	fadeout = 500,
	property = property,
	filepath = filepath
}

local function main()

	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	skin.source = {
		{id = "system",	path = "system.png"},
		{id = "groove", path = "groove.png"},
		{id = "bg_aaa",	path = "../customize/resultbg/aaa/*.png"},
		{id = "bg_aa",	path = "../customize/resultbg/aa/*.png"},
		{id = "bg_a",	path = "../customize/resultbg/a/*.png"},
		{id = "bg_c",	path = "../customize/resultbg/clear/*.png"},
		{id = "bg_f",	path = "../customize/resultbg/failed/*.png"},
	}

	skin.font = {
		{id = 0, path = "fnt/VLGothic_21_distance.fnt", type = 1},
		{id = 1, path = "timing.fnt"},
		{id = 2, path = "../customize/advanced/default_info2/fnt/title.fnt"},
		{id = 3, path = "../customize/advanced/default_info2/fnt/sub.fnt"},
	}

	skin.image = {
		{id = "bg_c",		src = "bg_c",	x = 0, y = 0, w = -1, h = -1},
		{id = "bg_aaa",		src = "bg_aaa",	x = 0, y = 0, w = -1, h = -1},
		{id = "bg_aa",		src = "bg_aa",	x = 0, y = 0, w = -1, h = -1},
		{id = "bg_a",		src = "bg_a",	x = 0, y = 0, w = -1, h = -1},
		{id = "bg_f",		src = "bg_f",	x = 0, y = 0, w = -1, h = -1},
		{id = "result_i",	src = "system", x = 618, y = 599, w = 406, h = 425},

		{id = "no_ir",		src = "system", x = 104, y = 319, w = 190, h = 21},
		{id = "ir",			src = "system", x = 104, y = 340, w = 180, h = 21},

		{id = "clear",		src = "system", x = 104, y = 361, w = 190, h = 231, divy = 11, len = 11, ref = 370},

		{id = "aaa",		src = "system", x = 0, y = 561, w = 84, h = 31},
		{id = "aa",			src = "system", x = 0, y = 530, w = 84, h = 31},
		{id = "a",			src = "system", x = 0, y = 499, w = 84, h = 31},
		{id = "b",			src = "system", x = 0, y = 468, w = 84, h = 31},
		{id = "c",			src = "system", x = 0, y = 437, w = 84, h = 31},
		{id = "d",			src = "system", x = 0, y = 406, w = 84, h = 31},
		{id = "e",			src = "system", x = 0, y = 375, w = 84, h = 31},
		{id = "f",			src = "system", x = 0, y = 344, w = 84, h = 31},

		{id = "unknown",	src = "system", x = 84, y = 466, w = 20, h = 21},
		{id = "beginner",	src = "system", x = 84, y = 487, w = 20, h = 21},
		{id = "normal",		src = "system", x = 84, y = 508, w = 20, h = 21},
		{id = "hyper",		src = "system", x = 84, y = 529, w = 20, h = 21},
		{id = "another",	src = "system", x = 84, y = 550, w = 20, h = 21},
		{id = "insane",		src = "system", x = 84, y = 571, w = 20, h = 21},

		{id = "percent_sign", src = "groove" , x = 110, y = 9, w = 9, h = 8},
		{id = "percent_dot", src = "groove" , x = 44, y = 29, w = 7, h = 5},

		{id = "graph",		src = "system", x = 84, y = 453, w = 13, h = 13},

		{id = "replay_1",	src = "system", x = 308, y = 562, w = 28, h = 31, act = 19},
		{id = "replay_2",	src = "system", x = 308, y = 593, w = 28, h = 31, act = 316},
		{id = "replay_3",	src = "system", x = 308, y = 624, w = 28, h = 31, act = 317},
		{id = "replay_4",	src = "system", x = 308, y = 655, w = 28, h = 31, act = 318},
	}

	skin.value = {
		{id = "ir_rank",	src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 179},
		{id = "ir_total",	src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 180},

		{id = "rate",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 3, ref = 102},
		{id = "rate_ad",	src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 2, ref = 103},
		--{id = "rate_best",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 3, ref = 183},
		--{id = "rate_ad_best",	src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 2, ref = 184},
		{id = "level",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 2, ref = 96},

		{id = "percent", src = "groove", x = 0, y = 0, w = 110, h = 17, divx = 10, digit = 3, ref = 107},
		{id = "percent_dec", src = "groove", x = 0, y = 0, w = 110, h = 17, divx = 10, digit = 3, ref = 407},

		{id = "score",		src = "system", x = 0, y = 592, w = 286, h = 31, divx = 11, digit = 5, ref = 71},
		{id = "diffscore",	src = "system", x = 0, y = 644, w = 240, h = 42, divx = 12, divy = 2, digit = 6, ref = 152},
		{id = "combo",		src = "system", x = 0, y = 592, w = 286, h = 31, divx = 11, digit = 5, ref = 75},
		{id = "diffcombo",	src = "system", x = 0, y = 644, w = 240, h = 42, divx = 12, divy = 2, digit = 6, ref = 175},
		{id = "miss",		src = "system", x = 0, y = 592, w = 286, h = 31, divx = 11, digit = 5, ref = 76},
		{id = "diffmiss",	src = "system", x = 0, y = 686, w = 240, h = 42, divx = 12, divy = 2, digit = 6, ref = 178},

		{id = "pg_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 110},
		{id = "gr_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 111},
		{id = "gd_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 112},
		{id = "bd_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 113},
		{id = "pr_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 114},
		{id = "ms_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 420},
		{id = "cb_t",		src = "system", x = 0, y = 623, w = 220, h = 21, divx = 11, digit = 5, ref = 425},
		{id = "fast_t",		src = "system", x = 0, y = 644, w = 220, h = 21, divx = 11, digit = 5, ref = 423},
		{id = "slow_t",		src = "system", x = 0, y = 665, w = 220, h = 21, divx = 11, digit = 5, ref = 424},
	}

	local ave_timing	= main_state.number(374) + (main_state.number(375) * 0.01)
	local std_dev	= main_state.number(376) + (main_state.number(377) * 0.01)
	local tmg_str		= nil
	if ave_timing < 0 then
		ave_timing = ave_timing * -1
		tmg_str = "AVG " .. ave_timing .. " ms"  .. "  STD " ..  std_dev .. " ms"
	else
		tmg_str = "AVG " .. ave_timing .. " ms"  .. "  STD " ..  std_dev .. " ms"
	end

	title_str = main_state.text(12)
	table_str = main_state.text(1003)

	skin.text = {
		{id = "timing",	font = 1, size = 14, constantText = tmg_str},
		{id = "title",	font = 2, size = 36, align = 1, constantText = title_str},
		{id = "table",	font = 2, size = 36, align = 1, constantText = table_str},
	}

	---[[
	skin.gaugegraph = {{
		id = "gaugegraph",
		assistClearBGColor = "000000";
		assistAndEasyFailBGColor = "000000";
		grooveFailBGColor = "000000";
		grooveClearAndHardBGColor = "000000";
		exHardBGColor = "000000";
		hazardBGColor = "000000";
		assistClearLineColor = "ff00ff";
		assistAndEasyFailLineColor = "00ffff";
		grooveFailLineColor = "00ff00";
		grooveClearAndHardLineColor = "ff0000";
		exHardLineColor = "ffff00";
		hazardLineColor = "cccccc";
		borderlineColor = "ff0000";
		borderColor = "000000";

		}
	}
	skin.judgegraph = {
		{id = "judgegraph_j", type = 1},
		{id = "judgegraph_el", type = 2},
	}
	--]]

	local result_pos = {24, 66}
	if skin_config.option["Play Side"] == RESULT_R then result_pos[1] = 1490 end

	local groove_pos = {454, 49}
	if skin_config.option["Play Side"] == RESULT_R then groove_pos[1] = 1393 end

	local replay_1_pos	= {result_pos[1] + 240, result_pos[2] + 5}
	local replay_2_pos	= {result_pos[1] + 280, result_pos[2] + 5}
	local replay_3_pos	= {result_pos[1] + 320, result_pos[2] + 5}
	local replay_4_pos	= {result_pos[1] + 360, result_pos[2] + 5}
	local ir_pos		= {result_pos[1] + 13, result_pos[2] + 339 + 52}
	local ir_rank_pos	= {result_pos[1] + 73, result_pos[2] + 339 + 52}
	local ir_total_pos	= {result_pos[1] + 193, result_pos[2] + 339 + 52}
	local rate_pos		= {result_pos[1] + 113, result_pos[2] + 305 + 52}
	local rate_ad_pos	= {result_pos[1] + 181, result_pos[2] + 305 + 52}
	local clear_pos		= {result_pos[1] + 13, result_pos[2] + 281 + 52}
	local rank_pos		= {result_pos[1] + 241, result_pos[2] + 281 + 52}
	local diff_pos		= {result_pos[1] + 333, result_pos[2] + 281 + 52}
	local level_pos		= {result_pos[1] + 353, result_pos[2] + 281 + 52}
	local score_pos		= {result_pos[1] + 133, result_pos[2] + 237 + 52}
	local diffscore_pos	= {result_pos[1] + 273, result_pos[2] + 242 + 52}
	local combo_pos		= {result_pos[1] + 133, result_pos[2] + 202 + 52}
	local diffcombo_pos	= {result_pos[1] + 273, result_pos[2] + 207 + 52}
	local miss_pos		= {result_pos[1] + 133, result_pos[2] + 167 + 52}
	local diffmiss_pos	= {result_pos[1] + 273, result_pos[2] + 172 + 52}

	local jg_pos = {x = result_pos[1] + 73, y = {}}
	jg_pos.y[1] = result_pos[2] + 185
	for i = 2, 8, 1 do
		jg_pos.y[i] = jg_pos.y[i - 1] - 24
	end

	local timing_pos = {result_pos[1] + 182, result_pos[2] + 135 + 52}

	local graph_l = {}
	local graph_max = 0
	local notes_t = main_state.number(74)
	local num = {422, 419, 417, 415, 413, 411, 410, 412, 414, 416, 418, 421}
	for i, v in ipairs(num) do
		graph_l[i] = main_state.number(v) / notes_t * 100
		if graph_max < graph_l[i] then graph_max = graph_l[i] end
	end
	for i, v in ipairs(graph_l) do
		graph_l[i] = v / graph_max * 100
	end
	local graph_pos = {x = {}, y = result_pos[2] + 83}
	graph_pos.x[1] = result_pos[1] + 185
	for i = 2, 12, 1 do
		graph_pos.x[i] = graph_pos.x[i - 1] + 17
	end

	local dt = {0, 500, 1000}

	skin.destination = {
		{id = "bg_c", op = {90}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- BG
		{id = "bg_aaa", op = {90,300}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- BG
		{id = "bg_aa", op = {90,301}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- BG
		{id = "bg_a", op = {90,302}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- BG
		{id = -100, op = {90, STAGEFILE_ON}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- CLEAR
		{id = "bg_f", op = {91}, dst = {{x = 0, y = 0, w = 1920, h = 1080}}},-- BG

		{id = "result_i", loop = dt[2],	dst = {{time = dt[1], x = result_pos[1] - 12, y = result_pos[2] - 12, w = 430, h = 397, acc = 2, a = 0},{time = dt[2], x = result_pos[1], y = result_pos[2], w = 406, h = 425, a = 255}}},

		{id = "no_ir",		loop = dt[3],	op = {50},	dst = {{time = dt[1], x = ir_pos[1],		y = ir_pos[2],			w = 190, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "ir",			loop = dt[3],	op = {51},	dst = {{time = dt[1], x = ir_pos[1],		y = ir_pos[2],			w = 180, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "ir_rank",	loop = dt[3],	op = {51},	dst = {{time = dt[1], x = ir_rank_pos[1],	y = ir_rank_pos[2],		w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "ir_total",	loop = dt[3],	op = {51},	dst = {{time = dt[1], x = ir_total_pos[1],	y = ir_total_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "rate",		loop = dt[3],	dst = {{time = dt[1], x = rate_pos[1],		y = rate_pos[2],		w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "rate_ad",	loop = dt[3],	dst = {{time = dt[1], x = rate_ad_pos[1],	y = rate_ad_pos[2],		w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "clear",		loop = dt[3],	dst = {{time = dt[1], x = clear_pos[1],		y = clear_pos[2],		w = 190, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "aaa",	loop = dt[3], op = {300}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "aa",		loop = dt[3], op = {301}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "a",		loop = dt[3], op = {302}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "b",		loop = dt[3], op = {303}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "c",		loop = dt[3], op = {304}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "d",		loop = dt[3], op = {305}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "e",		loop = dt[3], op = {306}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "f",		loop = dt[3], op = {307}, dst = {{time = dt[1], x = rank_pos[1], y = rank_pos[2],	w = 84, h = 31, a = 0},{time = dt[3], a = 255}}},

		{id = "unknown",	loop = dt[3], op = {150}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "beginner",	loop = dt[3], op = {151}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "normal",		loop = dt[3], op = {152}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "hyper",		loop = dt[3], op = {153}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "another",	loop = dt[3], op = {154}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "insane",		loop = dt[3], op = {155}, dst = {{time = dt[1], x = diff_pos[1], y = diff_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "level", loop = dt[3], dst = {{time = dt[1], x = level_pos[1],		y = level_pos[2],		w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "score",		loop = dt[3], dst = {{time = dt[1], x = score_pos[1],		y = score_pos[2],		w = 26, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "diffscore",	loop = dt[3], dst = {{time = dt[1], x = diffscore_pos[1],	y = diffscore_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "combo",		loop = dt[3], dst = {{time = dt[1], x = combo_pos[1],		y = combo_pos[2],		w = 26, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "diffcombo",	loop = dt[3], dst = {{time = dt[1], x = diffcombo_pos[1],	y = diffcombo_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "miss",		loop = dt[3], dst = {{time = dt[1], x = miss_pos[1],		y = miss_pos[2],		w = 26, h = 31, a = 0},{time = dt[3], a = 255}}},
		{id = "diffmiss",	loop = dt[3], dst = {{time = dt[1], x = diffmiss_pos[1],	y = diffmiss_pos[2],	w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "pg_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[1], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "gr_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[2], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "gd_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[3], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "bd_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[4], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "pr_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[5], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "ms_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[6], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "cb_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[8], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "fast_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x, y = jg_pos.y[7], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},
		{id = "slow_t", loop = dt[3], dst = {{time = dt[1], x = jg_pos.x + 190, y = jg_pos.y[7], w = 20, h = 21, a = 0},{time = dt[3], a = 255}}},

		{id = "percent", op = {240}, offset = 51, dst = {{x = groove_pos[1], y = groove_pos[2], w = 14, h = 17}}},
		{id = "percent", op = {-240}, offset = 51, dst = {{x = groove_pos[1], y = groove_pos[2], w = 14, h = 17}}},
		{id = "percent_dot", offset = 51, dst = {{x = groove_pos[1] + 42, y = groove_pos[2], w = 7, h = 5}}},
		{id = "percent_dec", offset = 51, dst = {{x = groove_pos[1] + 21, y = groove_pos[2], w = 14, h = 17}}},
		{id = "percent_sign", offset = 51, dst = {{x = groove_pos[1] + 64, y = groove_pos[2], w = 9, h = 8}}},

		{id = "timing", loop = dt[3], dst = {{time = dt[2], x = timing_pos[1] + 12, y = timing_pos[2], w = 14, h = 14, r = 255, g = 255, b = 255, a = 0},{time = dt[3], x = timing_pos[1], a = 255}}},

		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[1],  y = graph_pos.y, w = 13, h = graph_l[1], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[2],  y = graph_pos.y, w = 13, h = graph_l[2], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[3],  y = graph_pos.y, w = 13, h = graph_l[3], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[4],  y = graph_pos.y, w = 13, h = graph_l[4], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[5],  y = graph_pos.y, w = 13, h = graph_l[5], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[6],  y = graph_pos.y, w = 13, h = graph_l[6], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[7],  y = graph_pos.y, w = 13, h = graph_l[7], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[8],  y = graph_pos.y, w = 13, h = graph_l[8], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[9],  y = graph_pos.y, w = 13, h = graph_l[9], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[10], y = graph_pos.y, w = 13, h = graph_l[10], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[11], y = graph_pos.y, w = 13, h = graph_l[11], a = 0},{time = dt[3], a = 255}}},
		{id = "graph", loop = dt[3], dst = {{time = dt[1], x = graph_pos.x[12], y = graph_pos.y, w = 13, h = graph_l[12], a = 0},{time = dt[3], a = 255}}},

		---[[
		--{id = "judgegraph_j", dst = {{time = 0, x = 454, y = 66, w = 1012, h = 60, a = 192}}},
		{id = "judgegraph_el",	op = {GRAPH_ON}, loop = dt[2],				dst = {{time = dt[1], x = 454, y = 66, w = 1012, h = 120, a = 0},{time = dt[2], a = 192}}},
		{id = "gaugegraph",		op = {GRAPH_ON}, loop = dt[2], blend = 2,	dst = {{time = dt[1], x = 454, y = 66, w = 1012, h = 120, a = 0},{time = dt[2], a = 255}}},
		--]]

		--{id = -110,		dst = {{x = 0, y = 18, w = 1920, h = 36, a = 127}}},

		{id = "replay_1", op = {196, -198},			dst = {{			x = replay_1_pos[1], y = replay_1_pos[2], w = 28, h = 31, a = 64}}},
		{id = "replay_1", op = {197, -198},			dst = {{			x = replay_1_pos[1], y = replay_1_pos[2], w = 28, h = 31}}},
		{id = "replay_1", op = {198}, loop = 0,		dst = {{time = 0,	x = replay_1_pos[1], y = replay_1_pos[2], w = 28, h = 31},{time = 500, a = 0},{time = 1000, a = 255}}},
		{id = "replay_2", op = {1196, -1198},		dst = {{			x = replay_2_pos[1], y = replay_2_pos[2], w = 28, h = 31, a = 64}}},
		{id = "replay_2", op = {1197, -1198},		dst = {{			x = replay_2_pos[1], y = replay_2_pos[2], w = 28, h = 31}}},
		{id = "replay_2", op = {1198}, loop = 0,	dst = {{time = 0,	x = replay_2_pos[1], y = replay_2_pos[2], w = 28, h = 31},{time = 500, a = 0},{time = 1000, a = 255}}},
		{id = "replay_3", op = {1199, -1201},		dst = {{			x = replay_3_pos[1], y = replay_3_pos[2], w = 28, h = 31, a = 64}}},
		{id = "replay_3", op = {1200, -1201},		dst = {{			x = replay_3_pos[1], y = replay_3_pos[2], w = 28, h = 31}}},
		{id = "replay_3", op = {1201}, loop = 0,	dst = {{time = 0,	x = replay_3_pos[1], y = replay_3_pos[2], w = 28, h = 31},{time = 500, a = 0},{time = 1000, a = 255}}},
		{id = "replay_4", op = {1202, -1204},		dst = {{			x = replay_4_pos[1], y = replay_4_pos[2], w = 28, h = 31, a = 64}}},
		{id = "replay_4", op = {1203, -1204},		dst = {{			x = replay_4_pos[1], y = replay_4_pos[2], w = 28, h = 31}}},
		{id = "replay_4", op = {1204}, loop = 0,	dst = {{time = 0,	x = replay_4_pos[1], y = replay_4_pos[2], w = 28, h = 31},{time = 500, a = 0},{time = 1000, a = 255}}},

		{id = "title",	dst = {{x = 960, y = 20, w = 24, h = 24, r = 201, g = 238}}},
		{id = "table",	dst = {{x = 960, y = 1046, w = 24, h = 24, g = 120, b = 120}}},

		{id = -110, loop = 500, timer = 2, dst = {{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},{time = 500, a = 255}}},

	}

	return skin
end

return {
	header = header,
	main = main
}
