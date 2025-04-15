local M = {}
local map = vim.keymap.set

-- Snacks options, we can enable plugins here
M.opts = {
    lazygit = {
        -- your lazygit configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        configure = true
    },
}

-- Keybindings for NORMAL mode only
M.keys = {
    { "<leader>gi", function() Snacks.lazygit() end, desc = "Open Lazygit" },
}

-- Run after Snacks initialization
M.init = function()
    local snacks = require("snacks")
end

return M
