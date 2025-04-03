return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = {},
    config = function()
      require "plugins.config.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.config.lspconfig"
    end,
  },
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
      require "plugins.config.treesitter"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function()
      require "plugins.config.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
  { "folke/which-key.nvim",  enabled = true, lazy = false }, -- disable a default nvchad plugin
}
