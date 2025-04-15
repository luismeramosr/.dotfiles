local servers = {
    "lua_ls",
    "html",
    "cssls",
    "gopls",
    "rust_analyzer",
    "taplo",
    "ts_ls",
    "tailwindcss",
    "svelte",
    "jdtls",
    "pyright",
    "angularls",
    "marksman",
    "hyperls"
}

local map = vim.keymap.set

local mason_lspconfig = require("mason-lspconfig")
-- mason_lspconfig.setup({
--     ensure_installed = servers
-- })

-- lsps with default config
vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    root_markers = { ".git" },
})

vim.lsp.enable(servers)

-- Autocmd for attaching keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local function description(desc)
            return { buffer = args.buf, desc = "LSP " .. desc }
        end
        map("n", "gd", vim.lsp.buf.definition, description("go to definition"))
        map("n", "gi", vim.lsp.buf.implementation, description("go to implementation"))
        map("n", "gr", "<cmd>Telescope lsp_references<CR>", description("go to references"))
        map("n", "<leader>D", vim.lsp.buf.type_definition, description("go to type definition"))
        map({ "n", "v" }, "J", vim.lsp.buf.code_action, description("Show code actions"))
        map("n", "K", vim.lsp.buf.hover, description("Show documentation"))
        map("n", "D", function()
            vim.diagnostic.open_float(nil, { focusable = true, focus = true })
        end, description("Focus diagnostics window"))
        map("n", "<leader>rn", require("nvchad.lsp.renamer"), description("Rename"))
        map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, description("show document symbols"))

        vim.diagnostic.show()
        require("nvim-autopairs").setup()
        vim.cmd([[
            autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = true, focus = false })
        ]])
    end,
})
