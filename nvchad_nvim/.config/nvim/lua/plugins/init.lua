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
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gi", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
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
        -- Rust tools
        "simrat39/rust-tools.nvim",
        after = "nvim-lspconfig",
        config = function()
            require("plugins.config.lsp.rust_tools")
        end,
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
    ------ Disabled ------
    { "hrsh7th/nvim-cmp", enabled = false },
    {
        "neovim/nvim-lspconfig",
        enabled = false,
    },
}
