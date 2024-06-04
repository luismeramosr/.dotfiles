-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
        file_ignore_patterns = { "node_modules", "target" },
        borderchars = { " ", " ", " ", " ", "", "", "", "" },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
})

require("telescope").load_extension("ui-select")

-- See `:help telescope.builtin`
kmap('n', '<leader>fo', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
kmap('n', '<leader>fz', require('telescope.builtin').live_grep, { desc = 'Fuzzy find' })
kmap('n', '<leader>fb', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

kmap('n', '<leader>ff', function()
    require("telescope.builtin").find_files()
end, { desc = 'Search files' })
kmap('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search help' })
kmap('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
