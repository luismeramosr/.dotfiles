-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local borders = require("icons").borders.single

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
        file_ignore_patterns = { "node_modules", "target" },
        borderchars = { borders.top, borders.right, borders.bottom, borders.left, borders.top_left, borders.top_right, borders.bottom_right, borders.bottom_left },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
})

pcall(require("telescope").load_extension, "fzf")


