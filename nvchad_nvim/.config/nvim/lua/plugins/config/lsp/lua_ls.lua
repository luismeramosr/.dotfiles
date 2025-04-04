dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

return {
    Lua = {
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
        },
    },
}
