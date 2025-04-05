-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local diagnostics = require("diagnostics")
local icons = require("icons")

local stbufnr = function()
    return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ayu_mirage",
    transparency = false,
    hl_add = {
        [diagnostics.error.hl] = { fg = "red" },
        [diagnostics.warn.hl] = { fg = "yellow" },
        [diagnostics.hint.hl] = { fg = "purple" },
        [diagnostics.info.hl] = { fg = "blue" },
        ["GitBranchName"] = { fg = "dark_purple", bg = "black2" },
    },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
    cmp = {
        style = "atom_colored",
        border = "none",
        format_colors = {
            tailwind = true,
        }
    },
        statusline = {
            theme = "vscode_colored",
            order = { "mode", "file", "diagnostics", "%=", "lsp_msg", "%=", "git", "lsp", "cursor", "cwd" },
            modules = {
                git = function()
                    if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
                        return ""
                    end

                    local git_status = vim.b[stbufnr()].gitsigns_status_dict

                    local added = (git_status.added and git_status.added ~= 0)
                            and ("%#GitSignsAdd# " .. icons.git.add .. git_status.added)
                        or ""
                    local changed = (git_status.changed and git_status.changed ~= 0)
                            and ("%#GitSignsChange# " .. icons.git.change .. git_status.changed)
                        or ""
                    local removed = (git_status.removed and git_status.removed ~= 0)
                            and ("%#GitSignsDelete# " .. icons.git.delete .. git_status.removed)
                        or ""
                    local branch_name = "%#GitBranchName#" .. "  " .. git_status.head .. " "

                    return branch_name .. added .. changed .. removed
                end,
            },
        },
        tabufline = {
            lazyload = false,
            order = { "buffers", "tabs", "btns" },
        },
}

return M
