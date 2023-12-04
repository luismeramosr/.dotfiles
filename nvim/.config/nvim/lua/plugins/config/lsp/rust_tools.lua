local rt = require("rust-tools")
local lsp = require("plugins.config.lsp")

rt.setup({
  tools = {
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,
      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
    },
  },
  server = {
    standalone = false,
    on_attach = lsp.on_attach,
    handlers = lsp.handlers,
    settings = {
      ["rust-analyzer"] = {
        cachePriming = {
          enable = true
        },
        lens = {
          enable = true
        },
        checkOnSave = {
          command = "check"
        },
        cargo = {
          buildScripts = {
            enabled = false,
          }
        },
        procMacro = {
          enable = true,
        },
        completion = {
          autoimport = {
            enable = true,
          },
          autoself = {
            enable = true,
          },
        },
      },
    },
  },
})
