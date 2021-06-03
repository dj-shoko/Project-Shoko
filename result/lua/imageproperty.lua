local module = {}

module.image = {
  {id = "stagefile",		src = "stagefile",	x = 0, y = 0, w = -1, h = -1},
  {id = "bg_aaa",		src = "bg_aaa",	x = 0, y = 0, w = -1, h = -1},
  {id = "bg_aa",		src = "bg_aa",	x = 0, y = 0, w = -1, h = -1},
  {id = "bg_a",		src = "bg_a",	x = 0, y = 0, w = -1, h = -1},
  {id = "bg_c",		src = "bg_c",	x = 0, y = 0, w = -1, h = -1},
  {id = "bg_f",		src = "bg_f",	x = 0, y = 0, w = -1, h = -1},

  {id = "clear",		src = "parts", x = 0, y = 0, w = 202, h = 341, divy = 11, len = 11, ref = 370},
  {id = "bestclear",		src = "parts", x = 0, y = 0, w = 202, h = 341, divy = 11, len = 11, ref = 371},

  {id = "stage",		src = "parts", x = 0, y = 410, w = 542, h = 85},
  {id = "titlebox",		src = "parts", x = 0, y = 1460, w = 2560, h = 70},

  {id = "graphbox",		src = "parts", x = 750, y = 1015, w = 724, h = 420},
  {id = "gaugeborder",		src = "parts", x = 750, y = 403, w = 688, h = 342},
  {id = "levelbox",		src = "parts", x = 816, y = 0, w = 675, h = 60},

  {id = "clearinfobox",		src = "parts", x = 0, y = 526, w = 724, h = 467},
  {id = "clearinfo",		src = "parts", x = 554, y = 0, w = 262, h = 386},

  {id = "judgeinfobox",		src = "parts", x = 0, y = 1013, w = 724, h = 360},
  {id = "judgeinfo",		src = "parts", x = 242, y = 0, w = 151, h = 275},

  {id = "pieborder",		src = "parts", x = 1544, y = 1166, w = 280, h = 280},
  {id = "piepiece",		src = "parts", x = 1547, y = 1150, w = 274, h = 14},

  {id = "songinfobox",		src = "parts", x = 1532, y = 0, w = 724, h = 602},
  {id = "stagefileborder",		src = "parts", x = 1532, y = 602, w = 724, h = 546},

  {id = "sl",		src = "parts", x = 242, y = 336, w = 108, h = 36},
  {id = "fs",		src = "parts", x = 242, y = 289, w = 108, h = 36},

  {id = "cbtext",		src = "parts", x = 749, y = 960, w = 306, h = 36},
  {id = "cbbox",		src = "parts", x = 144, y = 1381, w = 580, h = 59},

  {id = "current",		src = "parts", x = 550, y = 405, w = 140, h = 44},
  {id = "best",		src = "parts", x = 550, y = 457, w = 160, h = 52},

  {id = "ratepercent",			src = "parts", x = 974, y = 870, w = 21, h = 19},
  {id = "rateperiod",			src = "parts", x = 964, y = 870, w = 10, h = 18},

  {id = "gaugeperiod",			src = "parts", x = 1206, y = 60, w = 10, h = 38},
  {id = "gaugepercent",			src = "parts", x = 1162, y = 60, w = 38, h = 38},

  {id = "ir_slash",			src = "parts", x = 1004, y = 98, w = 14, h = 19},
}

for i = 0, 7 do
  table.insert(module.image, {id = "gradesmall"..i,		src = "parts", x = 420, y = 0 + 48 * i, w = 101, h = 38})
  table.insert(module.image, {id = "gradelarge"..i,		src = "grade", x = 0, y = 0 + 178 * i, w = 415, h = 178})
end

return module
