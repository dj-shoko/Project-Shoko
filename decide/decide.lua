local function append_all(list, list1)
	for i, v in ipairs(list1) do
		table.insert(list, v)
	end
end

local header = {
	type = 6,
	name = "Project Shoko Decide",
	w = 2560,
	h = 1440,
	fadeout = 500,	-- Fade Out Time
	scene = 3000,	-- Main Scene Time
	input = 400,	-- Skip Time
	property = {
		{name = "Stage File", def = "On", item = {
			{name = "On", op = 915},
			{name = "Off", op = 916},
		}},
		{name = "Subtitle", def = "On", item = {
			{name = "On", op = 917},
			{name = "Off", op = 918},
			{name = "Merge with Title", op = 919},
		}},
	},
}

local function main()
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	--Commonly used variable values
	local centerX = 1280
	local tableY = 60
	local diffX = 1120
	local diffY = 1050
	local levelX = 1185
	local levelY = 1115
	local genreY = 980
	local titleY = 900
	local subY = 740
	local artistY = 540

	skin.source =  {
		{id = 1, path = "customize/image/*.png"},
		{id = 2, path = "customize/movie/*.mp4"}, --Yeah later
		{id = 3, path = "parts/parts.png"},
	}

	-- Font
	local mainShadowOffset = 3
	local subShadowOffset = 2

	skin.font =  {
		{id = 0, path = "../fonts/MPLUSRounded1c-Bold.ttf"},
		{id = 1, path = "../fonts/MPLUSRounded1c-Medium.ttf"},
		{id = 2, path = "../fonts/MPLUSRounded1c-Regular.ttf"},
		{id = 3, path = "../fonts/bitmap/Decide/Title.fnt"},
		{id = 4, path = "../fonts/bitmap/Decide/Artist.fnt"},
		{id = 5, path = "../fonts/bitmap/Decide/Sub.fnt"},
	}
	skin.text = {
		{id = "table", font = 4, size = -58, ref = 1003, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		{id = "genre", font = 4, size = -58, ref = 13, overflow = 1, align = 1},
		{id = "title", font = 3, size = -118, ref = 10, overflow = 1, align = 1},
		{id = "fulltitle", font = 3, size = -118, ref = 12, overflow = 1, align = 1},
		{id = "subtitle", font = 4, size = -58, ref = 11, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		{id = "artist", font = 4, size = -58, ref = 14, overflow = 1, align = 1},
	}

	skin.image = {
		--Background
		{id = "bg", src = 1, x = 0, y = 0, w = -1, h = -1},
		--Level
		{id = "beginner", src = 3, x = 0, y = 744, w = 320, h = 60},
		{id = "normal", src = 3, x = 0, y = 804, w = 320, h = 60},
		{id = "hyper", src = 3, x = 0, y = 864, w = 320, h = 60},
		{id = "another", src = 3, x = 0, y = 924, w = 320, h = 60},
		{id = "insane", src = 3, x = 0, y = 984, w = 320, h = 60},
		{id = "unknown", src = 3, x = 0, y = 1044, w = 320, h = 60},
	}
	skin.value = {
		--Song Difficulty Number
		{id = "numBeginner", src = 3, x = 0, y = 0, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "numNormal", src = 3, x = 0, y = 124, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "numHyper", src = 3, x = 0, y = 248, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "numAnother", src = 3, x = 0, y = 372, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "numInsane", src = 3, x = 0, y = 496, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
		{id = "numUnknown", src = 3, x = 0, y = 620, w = 950, h = 124, divx = 10, digit = 2, align = 2, ref = 96},
	}

	skin.destination = {}
	--Background
	table.insert(skin.destination,	{
		id = "bg", loop = 2800, blend = 1, dst = {
			{time = 0, x = -1570, y = -942, w = 5740, h = 3232, a = 255, r = 200, g = 200, b = 200},
			{time = 200, x = 0, y = 0, w = 2560, h = 1440, a = 255, r = 255, g = 255, b = 255},
			{time = 2600, x = 0, y = 0, w = 2560, h = 1440, a = 255, r = 255, g = 255, b = 255},
			{time = 2800, x = 0, y = 0, w = 2560, h = 1440, a = 0, r = 255, g = 255, b = 255},
		}
	})
	table.insert(skin.destination,	{
		id = "bg", loop = 2000, blend = 1, dst = {
			{time = 600, x = 0, y = 0, w = 2560, h = 1440, a = 120, r = 255, g = 255, b = 255},
			{time = 2000, x = -1570, y = -942, w = 5740, h = 3232, a = 0, r = 200, g = 200, b = 200},
		}
	})
	table.insert(skin.destination,	{
		id = "bg", loop = 2500, blend = 1, dst = {
			{time = 1100, x = 0, y = 0, w = 2560, h = 1440, a = 120, r = 255, g = 255, b = 255},
			{time = 2500, x = -1570, y = -942, w = 5740, h = 3232, a = 0, r = 200, g = 200, b = 200},
		}
	})
	table.insert(skin.destination,	{
		id = "bg", loop = 2800, blend = 1, dst = {
			{time = 900, x = 0, y = 0, w = 2560, h = 1440, a = 120, r = 255, g = 255, b = 255},
			{time = 2800, x = -1570, y = -942, w = 5740, h = 3232, a = 0, r = 200, g = 200, b = 200},
		}
	})

	-- Table Name
	table.insert(skin.destination, {
		id = "table", loop = -1, dst = {
			{x = centerX, y = tableY - 75, w = 1720, h = 58},
			{time = 300, x = centerX, y = tableY, a = 255},
			{time = 2750, x = centerX, y = tableY, a = 255},
			{time = 2950, x = centerX, y = tableY, a = 0},
		}
	})

	-- Genre Name
	table.insert(skin.destination, {
		id = "genre", loop = -1, dst = {
			{time = 0, x = centerX, y = genreY + 50, w = 1720, h = 58, a = 00},
			{time = 300, x = centerX, y = genreY, a = 255},
			{time = 2750, x = centerX, y = genreY, a = 255},
			{time = 2950, x = centerX, y = genreY, a = 0},
		}
	})

	-- Song Title
	table.insert(skin.destination, {
		id = "title", filter = 1, loop = -1, op = {-919}, dst = {
			{time = 0, x = centerX, y = titleY, a = 0, w = 2580, h = 180},
			{time = 300, x = centerX, y = titleY, a = 255, w = 1720, h = 118},
			{time = 2750, x = centerX, y = titleY, a = 255, w = 1720, h = 118},
			{time = 2950, x = centerX, y = titleY, a = 0, w = 1720, h = 118},
		}
	})

	-- Song Title
	table.insert(skin.destination, {
		id = "fulltitle", filter = 1, loop = -1, op = {919}, dst = {
			{time = 0, x = centerX, y = titleY, a = 0, w = 2580, h = 180},
			{time = 300, x = centerX, y = titleY, a = 255, w = 1720, h = 118},
			{time = 2750, x = centerX, y = titleY, a = 255, w = 1720, h = 118},
			{time = 2950, x = centerX, y = titleY, a = 0, w = 1720, h = 118},
		}
	})

	-- Subtitle
	table.insert(skin.destination, {
		id = "subtitle", loop = -1, op = {917}, dst = {
			{time = 0, x = centerX, y = subY - 50, a = 0, w = 1720, h = 58},
			{time = 300, x = centerX, y = subY, a = 255},
			{time = 2750, x = centerX, y = subY, a = 255},
			{time = 2950, x = centerX, y = subY, a = 0},
		}
	})

	-- Artist
	table.insert(skin.destination, {
		id = "artist", loop = -1, dst = {
			{x = centerX, y = artistY - 15, w = 1720, h = 58, a = 0},
			{time = 300, x = centerX, y = artistY, a = 255},
			{time = 2750, x = centerX, y = artistY, a = 255},
			{time = 2950, x = centerX, y = artistY, a = 0},
		}
	})

	-- Stage File
	table.insert(skin.destination,	{
		id = "-100", op = {915}, loop = -1, dst = {
			{time = 0, x = 1012, y = 63, w = 536, h = 400, a = 0, stretch = 1, filter = 1},
			{time = 300, x = 1079, y = 130, w = 402, h = 300, a = 255},
			{time = 2750, x = 1079, y = 130, a = 255},
			{time = 2950, x = 1079, y = 130, a = 0},
		}
	})

	--Difficulty shit
	do
		local option = {151, 152, 153, 154, 155, 150}
		local difficulty = {"beginner", "normal", "hyper", "another", "insane", "unknown"}
		local level = {"numBeginner", "numNormal", "numHyper", "numAnother", "numInsane", "numUnknown"}
		for i = 1, 6, 1 do
			--Difficulty
			table.insert(skin.destination, {
				id = difficulty[i], op = {option[i]}, loop = -1, dst = {
					{time = 0, x = diffX, y = diffY + 50, w = 320, h = 60, a = 0},
					{time = 300, x = diffX, y = diffY, a = 255},
					{time = 2750, x = diffX, y = diffY, a = 255},
					{time = 2950, x = diffX, y = diffY, a = 0},
				}
			})
			--Level
			table.insert(skin.destination, {
				id = level[i], op = {option[i]}, loop = -1, dst = {
					{time = 0, x = levelX, y = levelY + 50, w = 95, h = 124, a = 0},
					{time = 300, x = levelX, y = levelY, a = 255},
					{time = 2750, x = levelX, y = levelY, a = 255},
					{time = 2950, x = levelX, y = levelY, a = 0},
				}
			})
		end
	end
	return skin
end

return{
	header = header,
	main = main
}
