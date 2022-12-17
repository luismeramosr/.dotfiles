local rt = require("rust-tools")
local lspconfig = require("plugins.configs.lspconfig")

rt.setup({
  server = {
    on_attach = lspconfig.on_attach,
  },
})
