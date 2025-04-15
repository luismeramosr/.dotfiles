local M = {}

M.git = {
    add = " ",
    change = " ",
    delete = " ",
    untracked = "",
}

M.diagnostics = {
    error = " ",
    warn = " ",
    hint = "",
    info = " ",
}

M.terminal = {
    os = "󰣇 "
}

M.misc = {
    todo = " ",
    fixme = " ",
    warn = " ",
    perf = "󰅒 ",
    note = " ",
}

return M
