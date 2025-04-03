vim.g.startify_bookmarks = {
    { c = "~/.config/nvim/init.lua" },
    { n = "~/Documents/notes/index.md" },
}

vim.g.startify_lists = {
    { type = "sessions", header = { "   Sessions" } },
    { type = "dir", header = { "   Current Working Directory " .. vim.fn.getcwd() } },
    { type = "bookmarks", header = { "   Bookmarks" } },
}
