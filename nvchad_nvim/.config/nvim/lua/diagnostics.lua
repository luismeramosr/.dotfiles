-- LSP Diagnostics Options Setup
local icons = require("icons").diagnostics

local signs = {
    error = { hl = "DiagnosticSignError", text = icons.error },
    warn = { hl = "DiagnosticSignWarn", text = icons.warn },
    hint = { hl = "DiagnosticSignHint", text = icons.hint },
    info = { hl = "DiagnosticSignInfo", text = icons.info },
}

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.error.text,
            [vim.diagnostic.severity.WARN] = signs.warn.text,
            [vim.diagnostic.severity.HINT] = signs.hint.text,
            [vim.diagnostic.severity.INFO] = signs.info.text,
        },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = signs.error.hl,
        -- },
        numhl = {
            [vim.diagnostic.severity.ERROR] = signs.error.hl,
            [vim.diagnostic.severity.WARN] = signs.warn.hl,
            [vim.diagnostic.severity.HINT] = signs.hint.hl,
            [vim.diagnostic.severity.INFO] = signs.info.hl,
        },
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        border = "",
        source = true,
        header = "",
        prefix = "",
    },
})

vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = true })
]])

return signs
