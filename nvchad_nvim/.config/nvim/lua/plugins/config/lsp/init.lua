local servers = {
    html = {},
    cssls = {},
    gopls = {},
    rust_analyzer = {},
    taplo = {},
    ts_ls = {},
    tailwindcss = {},
    svelte = {},
    jdtls = {},
    pyright = {},
    angularls = {},
    marksman = {},
    lua_ls = require("plugins.config.lsp.lua_ls"),
}

local map = vim.keymap.set
local unset = vim.keymap.del

-- export on_attach & capabilities
local on_attach = function(_, bufnr)
    local function description(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gd", vim.lsp.buf.definition, description("go to definition"))
    map("n", "gi", vim.lsp.buf.implementation, description("go to implementation"))
    map("n", "gr", "<cmd>Telescope lsp_references<CR>", description("go to references"))
    map("n", "<leader>D", vim.lsp.buf.type_definition, description("go to type definition"))
    map({ "n", "v" }, "J", vim.lsp.buf.code_action, description("Show code actions"))
    map("n", "K", vim.lsp.buf.hover, description("show documentation"))
    map("n", "<leader>rn", require("nvchad.lsp.renamer"), description("Rename"))
    map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, description("show document symbols"))

    -- Removing useless keymaps
    unset("n", "gra", {})
    unset("n", "gri", {})
    unset("n", "grn", {})
    unset("n", "grr", {})
end

local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

-- lsps with default config
for lsp, settings in pairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        settings = settings,
    })
end
