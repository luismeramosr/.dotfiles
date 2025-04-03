require "nvchad.mappings"

local kmap = vim.keymap.set

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

----- GENERAL ------
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

kmap("n", ";", ":", { desc = "CMD enter command mode" })
kmap("i", "jk", "<ESC>")
kmap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
kmap("n", "<C-s>", ":silent wa<CR>", { desc = "Saves the current buffer", silent = true })
kmap("i", "jk", "<ESC>", { desc = "Scapes when pressing jk in insert mode", silent = true })

-- Remap for dealing with word wrap
kmap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NvimTreeToggle
kmap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggles nvim tree", silent = true })

-- Diagnostic
kmap("n", "<A-{>", vim.diagnostic.get_prev, { desc = "Go to previous diagnostic message" })
kmap("n", "<A-}>", vim.diagnostic.get_next, { desc = "Go to next diagnostic message" })

------ WINDOW NAVIGATION ------
kmap("n", "<C-h>", "<C-w>h", { desc = "Moves to the buffer on the left", silent = true })
kmap("n", "<C-j>", "<C-w>j", { desc = "Moves to the buffer on the bottom", silent = true })
kmap("n", "<C-k>", "<C-w>k", { desc = "Moves to the buffer on the top", silent = true })
kmap("n", "<C-l>", "<C-w>l", { desc = "Moves to the buffer on the right", silent = true })

------ SPLIT MOVEMENT ------
kmap("n", "<leader>l", "<C-w>t<C-w>K", { desc = "Rotates the split clockwise", silent = true })
kmap("n", "<leader>h", "<C-w>t<C-w>H", { desc = "Rotates the split counter-clockwise", silent = true })

------ WINDOW RESIZING ------
kmap("n", "<A-k>", "<C-w>+", { desc = "Increases split height", silent = true })
kmap("n", "<A-j>", "<C-w>-", { desc = "Decreases split height", silent = true })
kmap("n", "<A-l>", "<C-w>>", { desc = "Increases split width", silent = true })
kmap("n", "<A-h>", "<C-w><", { desc = "Decreases split width", silent = true })

------ TABS NAVIGATION ------
kmap("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Close the current tab ", silent = true, remap = true })
kmap("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Close the current tab ", silent = true, remap = true })

kmap("n", "<leader>x", ":q<CR>", { desc = "Closes the current window", silent = true })
-- kmap('n', '<leader>fm', ':Format<CR>', { desc = "Formats the current buffer", silent = true })
kmap("n", "<leader>m", ":Startify<CR>", { desc = "Opens the startify dashboard", silent = true })
kmap("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close the current tab ", silent = true, remap = true })

------ TERMINAL MAPS ------
kmap("t", "JK", "<C-\\><C-N>", { desc = "Scapes when pressing jk in terminal mode", silent = true })
kmap("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Moves to the buffer on the left", silent = true })
kmap("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Moves to the buffer on the bottom", silent = true })
kmap("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Moves to the buffer on the top", silent = true })
kmap("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Moves to the buffer on the right", silent = true })

kmap(
  "n",
  "<C-t>",
  ":ToggleTerm direction=horizontal name=Terminal<CR>",
  { desc = "Toggles the terminal view", silent = true }
)

kmap("n", "<C-c><C-d>", function()
  local api = require "nvim-tree.api"
  api.tree.change_root_to_node()
end, { desc = "Changes the current root node", silent = true })

----- LazyGit ------
kmap("n", "<leader>gi", ":LazyGit<CR>", { desc = "Opens LazyGit", noremap = true, silent = true })

kmap("n", "<leader>t", ":TodoTelescope<CR>", { desc = "List all todo comments", noremap = true, silent = true })
kmap("n", "{", function()
  require("todo-comments").jump_prev()
end, { desc = "Go to previous todo comment", noremap = true, silent = true })
kmap("n", "}", function()
  require("todo-comments").jump_next()
end, { desc = "Go to next todo comment", noremap = true, silent = true })

----- Telescope ------
-- See `:help telescope.builtin`
kmap("n", "<leader>fo", "<cmd>Telescope buffers<CR>", { desc = "Find existing buffers" })
kmap("n", "<leader>fz", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find" })
kmap("n", "<leader>fb", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })

kmap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Search in project files" })
kmap(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Search in all files" }
)
kmap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help" })
kmap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Search diagnostics" })
kmap(
  "n",
  "<leader>im",
  [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
  { desc = "Opens telescope to find and select an interface to implement", noremap = true, silent = true }
)

------ Disabled ------

local unset = vim.keymap.del

unset("n", "<leader>fw", {})
