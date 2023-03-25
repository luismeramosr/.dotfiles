-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
function kmap(mode, key, action, opts)
  vim.keymap.set(mode, key, action, opts)
end

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

----- GENERAL ------
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
kmap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
kmap('n', '<C-s>', ':wa<CR>', { desc = "Saves the current buffer", silent = true })
kmap('i', 'jk', '<ESC>', { desc = "Scapes when pressing jk in insert mode" , silent = true })

-- Remap for dealing with word wrap
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NvimTreeToggle
kmap('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggles nvim tree", silent = true })

-- Diagnostic
kmap('n', '<A-{>', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
kmap('n', '<A-}>', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

----- NAVIGATION ------
kmap('n', '<C-h>', '<C-w>h', { desc = "Moves to the buffer on the left", silent = true })
kmap('n', '<C-j>', '<C-w>j', { desc = "Moves to the buffer on the bottom", silent = true })
kmap('n', '<C-k>', '<C-w>k', { desc = "Moves to the buffer on the top", silent = true })
kmap('n', '<C-l>', '<C-w>l', { desc = "Moves to the buffer on the right", silent = true })
kmap('n', '<leader>q', ':q<CR>', { desc = "Closes the current buffer", silent = true })
kmap('n', '<leader>f', ':Format<CR>', { desc = "Formats the current buffer", silent = true})
