local module = {}

module.value = {
  {id = "bestscore",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 170},
  {id = "currentscore",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 71},
  {id = "diffscore",	src = "parts", x = 750, y = 870, w = 192, h = 36, divx = 12, divy = 2, digit = 5, zeropadding = 5, ref = 152},
  {id = "bestcombo",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 173},
  {id = "currentcombo",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 75},
  {id = "diffcombo",	src = "parts", x = 750, y = 870, w = 192, h = 36, divx = 12, divy = 2, digit = 5, zeropadding = 5, ref = 175},
  {id = "bestmiss",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, zeropadding = 5, ref = 176},
  {id = "currentmiss",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 76},
  {id = "diffmiss",	src = "parts", x = 750, y = 906, w = 192, h = 36, divx = 12, divy = 2, digit = 5, zeropadding = 5, ref = 178},
  {id = "target",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 151},
  {id = "difftarget",	src = "parts", x = 750, y = 792, w = 384, h = 74, divx = 12, divy = 2, digit = 5, zeropadding = 5, ref = 153},

  {id = "bestrate",	src = "parts", x = 750, y = 870, w = 176, h = 18, divx = 11, digit = 3, zeropadding = 3, ref = 183},
  {id = "bestratedec",	src = "parts", x = 950, y = 924, w = 176, h = 18, divx = 11, digit = 2, ref = 184},
  {id = "currentrate",	src = "parts", x = 750, y = 870, w = 176, h = 18, divx = 11, digit = 3, zeropadding = 3, ref = 102},
  {id = "currentratedec",	src = "parts", x = 950, y = 924, w = 176, h = 18, divx = 11, digit = 2, ref = 103},

  {id = "ep",		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 420},
  {id = "epf",		src = "parts", x = 750, y = 755, w = 352, h = 37, divx = 11, digit = 4, ref = 421},
  {id = "eps",		src = "parts", x = 750, y = 829, w = 352, h = 37, divx = 11, digit = 4, ref = 422},
  {id = "fast",		src = "parts", x = 750, y = 755, w = 352, h = 37, divx = 11, digit = 4, ref = 423},
  {id = "slow",		src = "parts", x = 750, y = 829, w = 352, h = 37, divx = 11, digit = 4, ref = 424},
  {id = "cb",		src = "parts", x = 750, y = 792, w =   352, h = 37, divx = 11, digit = 4, ref = 425},
}

for i = 0, 4 do
  table.insert(module.value, {id = "jg"..i,		src = "parts", x = 750, y = 792, w = 352, h = 37, divx = 11, digit = 4, ref = 110 + 1 * i})
  table.insert(module.value, {id = "jgf"..i,		src = "parts", x = 750, y = 755, w = 352, h = 37, divx = 11, digit = 4, ref = 410 + 2 * i})
  table.insert(module.value, {id = "jgs"..i,		src = "parts", x = 750, y = 829, w = 352, h = 37, divx = 11, digit = 4, ref = 411 + 2 * i})
end

return module
