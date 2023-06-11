local util = require("plugins.custom.util")
local M = {}

function get_terminal_bufnr()
	-- get the buffer number
	return vim.fn.bufnr("fish")
end

function terminal_is_hidden()
	local buffer_number = get_terminal_bufnr()

	-- check if the buffer is hidden
	local buffers = vim.api.nvim_exec2("buffers", { output = true }).output
	local is_hidden = false

	for line in string.gmatch(buffers, "[^\n]+") do
		local values = util.split(line, "%s")

		if tonumber(values[0]) ~= buffer_number then
			goto continue
		else
			if string.match(values[1], "h") then
				is_hidden = true
			end
		end

		::continue::
	end
	return is_hidden
end

M.toggleterm = function()
	local buffer_number = get_terminal_bufnr()
	if buffer_number ~= -1 and vim.api.nvim_buf_is_loaded(buffer_number) then
		if terminal_is_hidden() then
			vim.cmd("10sp|buffer " .. buffer_number)
		else
			vim.cmd("hide")
		end
	else
		vim.cmd("10sp|term")
	end
end

return M
