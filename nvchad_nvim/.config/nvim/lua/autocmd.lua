function _G.set_terminal_keymaps()
    local opts = { buffer = 0, silent = true }
    vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- local path_to_startup_directory = "/home/luisr/Documents/Software"
--
-- local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
--
-- vim.api.nvim_create_autocmd(
--     { "VimEnter" },
--     { pattern = "*", command = "cd " .. path_to_startup_directory, group = vim_enter_group }
-- )

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- Set keymap for 'gd' to go to the markdown file
        vim.api.nvim_buf_set_keymap(0, "n", "gd", [[<cmd>lua go_to_markdown_file()<CR>]],
            { noremap = true, silent = true })
    end
})

-- Function to open the markdown file
function go_to_markdown_file()
    -- Get the current line from the buffer
    local line = vim.api.nvim_get_current_line()

    -- Extract the filename using pattern matching
    local filename = line:match("%[%[(.-)%]%]")

    -- If a filename is found, open the file
    if filename then
        -- Open the file in a new buffer
        vim.cmd("edit " .. filename .. ".md")
    else
        print("No note found. Creating a new note...")
        vim.cmd("edit " .. filename:gsub(" ", "_") .. ".md")
    end
end
