-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
        file_ignore_patterns = { "node_modules", "target" },
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

-- See `:help telescope.builtin`
kmap('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
-- kmap('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

kmap('n', '<C-p>', function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
        previewer = false,
    }))
end, { desc = 'Search files' })
kmap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search help' })
kmap('n', '<leader>a', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
