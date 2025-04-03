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
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lspconfig")
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
            "nvim-tree/nvim-web-devicons",
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
}
