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
	fadeout = 100,	-- Fade Out Time
	scene = 2300,	-- Main Scene Time
	input = 400,	-- Skip Time
	property = {
		{name = "Stage File ", def = "On", item = {
			{name = "On", op = 915},
			{name = "Off", op = 916},
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
	local tableY = 1280
	local diffX = 1120
	local diffY = 1050
	local levelX = 1185
	local levelY = 1115
	local genreY = 940
	local titleY = 800
	local subY = 720
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
		{id = 3, path = "../fonts/bitmap/Title.fnt"},
	}
	skin.text = {
		{id = "table", font = 1, size = 32, ref = 1003, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		{id = "genre", font = 1, size = 60, ref = 13, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		{id = "title", font = 3, size = -123, ref = 12, overflow = 1, align = 1},
		{id = "subtitle", font = 2, size = 45, ref = 11, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
		{id = "artist", font = 1, size = 60, ref = 14, overflow = 1, align = 1, shadowOffsetX = subShadowOffset, shadowOffsetY = subShadowOffset},
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
		id = "bg", loop = 2000, blend = 1, dst = {
			{time = 0, x = -1570, y = -942, w = 5740, h = 3232, a = 255, r = 200, g = 200, b = 200},
			{time = 200, x = 0, y = 0, w = 2560, h = 1440, a = 255, r = 255, g = 255, b = 255},
			{time = 1200, x = 0, y = 0, w = 2560, h = 1440, a = 255, r = 255, g = 255, b = 255},
			{time = 2000, x = 0, y = 0, w = 2560, h = 1440, a = 0, r = 255, g = 255, b = 255},
		}
	})
	table.insert(skin.destination,	{
		id = "bg", loop = 2000, blend = 1, dst = {
			{time = 600, x = 0, y = 0, w = 2560, h = 1440, a = 120, r = 255, g = 255, b = 255},
			{time = 2000, x = -1570, y = -942, w = 5740, h = 3232, a = 0, r = 200, g = 200, b = 200},
		}
	})
	table.insert(skin.destination,	{
		id = "bg", loop = 2300, blend = 1, dst = {
			{time = 900, x = 0, y = 0, w = 2560, h = 1440, a = 120, r = 255, g = 255, b = 255},
			{time = 2300, x = -1570, y = -942, w = 5740, h = 3232, a = 0, r = 200, g = 200, b = 200},
		}
	})

	-- Table Name
	table.insert(skin.destination, {
		id = "table", loop = -1, dst = {
			{x = centerX, y = tableY + 75, w = 1720, h = 32, r = 216, g = 245, b = 255},
			{time = 300, x = centerX, y = tableY, a = 255},
			{time = 1590, x = centerX, y = tableY, a = 255},
			{time = 1900, x = centerX, y = tableY, a = 0},
		}
	})

	-- Genre Name
	table.insert(skin.destination, {
		id = "genre", loop = -1, dst = {
			{time = 0, x = centerX, y = genreY + 50, w = 1720, h = 60, a = 00, r = 200, g = 200, b = 200},
			{time = 300, x = centerX, y = genreY, a = 255},
			{time = 1590, x = centerX, y = genreY, a = 255},
			{time = 1900, x = centerX, y = genreY, a = 0},
		}
	})

	-- Song Title
	table.insert(skin.destination, {
		id = "title", filter = 1, loop = -1, dst = {
			{time = 0, x = centerX, y = titleY, a = 0, w = 2580, h = 180},
			{time = 300, x = centerX, y = titleY, a = 255, w = 1720, h = 123},
			{time = 1590, x = centerX, y = titleY, a = 255, w = 1720, h = 123},
			{time = 1900, x = centerX, y = titleY, a = 0, w = 1720, h = 123},
		}
	})

	-- Subtitle
	table.insert(skin.destination, {
		id = "subtitle", loop = -1, dst = {
			{time = 0, x = centerX, y = subY - 50, a = 0, w = 1720, h = 45, r = 120, g = 120, b = 120},
			{time = 300, x = centerX, y = subY, a = 255},
			{time = 1590, x = centerX, y = subY, a = 255},
			{time = 1900, x = centerX, y = subY, a = 0},
		}
	})

	-- Artist
	table.insert(skin.destination, {
		id = "artist", loop = -1, dst = {
			{x = centerX, y = artistY - 15, w = 1720, h = 60, a = 0, r = 200, g = 200, b = 200},
			{time = 300, x = centerX, y = artistY, a = 255, r = 200, g = 200, b = 200},
			{time = 1590, x = centerX, y = artistY, a = 255},
			{time = 1900, x = centerX, y = artistY, a = 0},
		}
	})

	-- Stage File
	table.insert(skin.destination,	{
		id = "-100", op = {915}, loop = -1, dst = {
			{time = 0, x = 1012, y = 63, w = 536, h = 400, a = 0, stretch = 1, filter = 1},
			{time = 300, x = 1079, y = 130, w = 402, h = 300, a = 255},
			{time = 1590, x = 1079, y = 130, a = 255},
			{time = 1900, x = 1079, y = 130, a = 0},
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
					{time = 1590, x = diffX, y = diffY, a = 255},
					{time = 1900, x = diffX, y = diffY, a = 0},
				}
			})
			--Level
			table.insert(skin.destination, {
				id = level[i], op = {option[i]}, loop = -1, dst = {
					{time = 0, x = levelX, y = levelY + 50, w = 95, h = 124, a = 0},
					{time = 300, x = levelX, y = levelY, a = 255},
					{time = 1590, x = levelX, y = levelY, a = 255},
					{time = 1900, x = levelX, y = levelY, a = 0},
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
