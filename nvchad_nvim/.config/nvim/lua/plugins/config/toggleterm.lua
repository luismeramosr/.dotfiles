local icons = require("icons")

return {
    shell = "/bin/fish",
    persist_size = true,
    autochdir = true,
    -- Color customization
    -- highlights = {
    --     -- highlights which map to a highlight group name and a table of it's values
    --     -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    --     Normal = {
    --         guibg = "<VALUE-HERE>",
    --     },
    --     NormalFloat = {
    --         link = 'Normal'
    --     },
    --     FloatBorder = {
    --         guifg = "<VALUE-HERE>",
    --         guibg = "<VALUE-HERE>",
    --     },
    -- }
    shade_terminals = false,
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return icons.terminal.os .. "Archlinux"
        end
    }
}
