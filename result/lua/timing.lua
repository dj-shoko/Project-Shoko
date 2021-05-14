local module = {}

--Grades
for i = 0, 7 do
  table.insert(module.destination, {id = "gradesmall"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = playInfoX + 560, y = clearY + 272,	w = 101, h = 38, a = 0},
  {time = 200, a = 255}}}) --current
  table.insert(module.destination, {id = "gradesmall"..i,	loop = 200, op = {320 + 1 * i}, dst = {{time = 0, x = playInfoX + 332, y = clearY + 272,	w = 101, h = 38, a = 0},
  {time = 200, a = 255}}}) --best
  table.insert(module.destination, {id = "gradelarge"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = playInfoX + 34, y = 1144,	w = 415, h = 178, a = 0},
  {time = 200, a = 255}}}) --big
end

--Judges
for i = 0, 4 do
  table.insert(module.destination, {id = "judge"..i, filter = 1, op = {180 + 1 * i}, dst = {{x = songInfoX + 700, y = songY - 12, w = 560, h = 48, r = 221, g = 229, b = 237}}})
end

return module
