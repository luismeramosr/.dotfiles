-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Indenting settings
local indent_width = 4
vim.o.tabstop = indent_width
vim.o.softtabstop = indent_width
vim.o.shiftwidth = indent_width
vim.o.smarttab = false
vim.o.expandtab = true

-- Enable break indent
vim.o.breakindent = true

vim.opt.guifont = { "MonaspiceAr Nerd Font", ":h15" }

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.hidden = true

-- For neorg fixes
vim.o.conceallevel = 2
vim.o.shell = "/bin/fish"

if vim.g.neovide == true then
    -- vim.g.neovide_fullscreen = true
    vim.g.neovide_transparency = 1
end
