return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = {},
        config = function()
            require("plugins.config.conform")
        end,
    },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
            require("plugins.config.treesitter")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        config = function()
            require("plugins.config.noice")
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
    },
    { "folke/which-key.nvim", enabled = true, lazy = false }, -- disable a default nvchad plugin
    {
        -- File tree
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "echasnovski/mini.icons",
        },
        config = function()
            require("plugins.config.nvim-tree")
        end,
    },
    {
        -- Dashboard
        "mhinz/vim-startify",
        lazy = false,
        config = function()
            require("plugins.config.vim_startify")
        end,
    },
    {
        "folke/snacks.nvim",
        opts = require("plugins.config.snacks").opts,
        keys = require("plugins.config.snacks").keys,
        init = require("plugins.config.snacks").init,
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.config.gitsigns")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "windwp/nvim-autopairs",
        lazy = false,
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)
        end,
    },
    {
        "saghen/blink.cmp",
        lazy = false,
        -- optional: provides snippets for the snippet source
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        -- use a release tag to download pre-built binaries
        version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = require("plugins.config.blink"),
        opts_extend = { "sources.default" },
    },
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        version = "*",
        opts = require("plugins.config.toggleterm"),
    },
    {
        "nvzone/volt",
        lazy = true
    },
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTelescope" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = require("plugins.config.todo"),
    },
    "williamboman/mason-lspconfig.nvim",
    ------ Disabled ------
    { "hrsh7th/nvim-cmp",     enabled = false },
    {
        "neovim/nvim-lspconfig",
        enabled = false,
    },
}
