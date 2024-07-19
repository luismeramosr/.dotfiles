-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

local signs = require("icons").diagnostics

sign({ name = 'DiagnosticSignError', text = signs.error })
sign({ name = 'DiagnosticSignWarn', text = signs.warn })
sign({ name = 'DiagnosticSignHint', text = signs.hint })
sign({ name = 'DiagnosticSignInfo', text = signs.info })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'none',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
