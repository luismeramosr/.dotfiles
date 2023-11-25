function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local path_to_startup_directory = "/home/luisr/Documents/Software"

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

vim.api.nvim_create_autocmd(
    { "VimEnter" },
    { pattern = "*", command = "cd " .. path_to_startup_directory, group = vim_enter_group }
)
