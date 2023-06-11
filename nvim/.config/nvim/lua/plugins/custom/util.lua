local M = {}

M.split = function(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	local count = 0

	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, count, str)
		count = count + 1
	end
	return t
end

return M
