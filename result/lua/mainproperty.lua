local module = {}

module.property = {
	{name = "Play Side", item = {
		{name = "1P", op = 900},
		{name = "2P", op = 901}
	}},
	{name = "Stagefile", item = {
		{name = "ON", op = 910},
		{name = "OFF", op = 911}
	}},
	{name = "Judge Detail", item = {
		{name = "Extra Fast/Slow Info", op = 920},
		--{name = "Pie", op = 921} --WIP
	}},
	{name = "Network Info", item = {
		{name = "On", op = 922},
		--{name = "Off", op = 923} --WIP
	}},
}

return module
