-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local separators = {
    default = { left = "", right = "" },
    round = { left = "", right = "" },
    block = { left = "█", right = "█" },
    arrow = { left = "", right = "" },
}

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "chadracula",
    transparency = false,
    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
    cmp = {
        style = "atom_colored",
        border = "none",
        format_colors = {
            tailwind = true,
        },
    },
    statusline = {
        theme = "default",
        separator_style = "round",
        -- order = { "mode", "git", "f", "%=", "lsp_msg", "%=", "lsp", "cwd" },
        -- modules = {
        --     f = function()
        --         return " %f"
        --     end,
        -- },
    },
    tabufline = {
        lazyload = false,
        order = { "buffers", "tabs", "btns" },
    },
}

return M
