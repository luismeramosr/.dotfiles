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
kmap('i', 'jk', '<ESC>', { desc = "Scapes when pressing jk in insert mode", silent = true })

-- Remap for dealing with word wrap
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NvimTreeToggle
kmap('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggles nvim tree", silent = true })

-- Diagnostic
kmap('n', '<A-{>', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
kmap('n', '<A-}>', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

------ WINDOW NAVIGATION ------
kmap('n', '<C-h>', '<C-w>h', { desc = "Moves to the buffer on the left", silent = true })
kmap('n', '<C-j>', '<C-w>j', { desc = "Moves to the buffer on the bottom", silent = true })
kmap('n', '<C-k>', '<C-w>k', { desc = "Moves to the buffer on the top", silent = true })
kmap('n', '<C-l>', '<C-w>l', { desc = "Moves to the buffer on the right", silent = true })

------ SPLIT MOVEMENT ------
kmap('n', '<leader>l', '<C-w>t<C-w>K', { desc = "Rotates the split clockwise", silent = true })
kmap('n', '<leader>h', '<C-w>t<C-w>H', { desc = "Rotates the split counter-clockwise", silent = true })

------ WINDOW RESIZING ------
kmap('n', '<A-k>', '<C-w>+', { desc = "Increases split height", silent = true })
kmap('n', '<A-j>', '<C-w>-', { desc = "Decreases split height", silent = true })
kmap('n', '<A-l>', '<C-w>>', { desc = "Increases split width", silent = true })
kmap('n', '<A-h>', '<C-w><', { desc = "Decreases split width", silent = true })

------ TABS NAVIGATION ------
kmap('n', 'H', ":BufferLineCyclePrev<CR>", { desc = "Close the current tab ", silent = true, remap = true })
kmap('n', 'L', ":BufferLineCycleNext<CR>", { desc = "Close the current tab ", silent = true, remap = true })

kmap('n', '<leader>q', ':q<CR>', { desc = "Closes the current window", silent = true })
kmap('n', '<leader>f', ':Format<CR>', { desc = "Formats the current buffer", silent = true })
kmap('n', '<leader>m', ':Startify<CR>', { desc = "Opens the startify dashboard", silent = true })
kmap('n', '<C-w>', ":Bdelete<CR>", { desc = "Close the current tab ", silent = true, remap = true })

------ TERMINAL MAPS ------
kmap('t', 'JK', '<C-\\><C-N>', { desc = "Scapes when pressing jk in terminal mode", silent = true })
kmap('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = "Moves to the buffer on the left", silent = true })
kmap('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = "Moves to the buffer on the bottom", silent = true })
kmap('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = "Moves to the buffer on the top", silent = true })
kmap('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = "Moves to the buffer on the right", silent = true })

kmap('n', '<C-t>', ':ToggleTerm direction=horizontal name=Terminal<CR>', { desc = "Toggles the terminal view" })

kmap('n', '<C-c><C-d>', function()
    local api = require("nvim-tree.api")
    api.tree.change_root_to_node()
end, { desc = "Changes the current root node", silent = true })


kmap('n', '<leader>im', [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
    { desc = "Opens telescope to find and select an interface to implement", noremap = true, silent = true })

kmap('n', '<leader>gg', ':LazyGit<CR>', { desc = "Opens LazyGit", noremap = true, silent = true })

kmap('n', '<leader>t', ':TodoTelescope<CR>', { desc = "List all todo comments", noremap = true, silent = true })
kmap('n', '{', function()
    require("todo-comments").jump_prev()
end, { desc = "Go to previous todo comment", noremap = true, silent = true })
kmap('n', '}', function()
    require("todo-comments").jump_next()
end, { desc = "Go to next todo comment", noremap = true, silent = true })

