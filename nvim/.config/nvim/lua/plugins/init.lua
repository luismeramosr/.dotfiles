-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- NOTE: First, some plugins that don't require any configuration

    -- Git related plugins
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = "legacy", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            {
                "folke/neodev.nvim",
                config = function()
                    require("plugins.config.neodev")
                end,
            },
        },
    },
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip" },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("plugins.config.lsnip")
        end
    },
    -- Useful plugin to show you pending keybinds.
    { "folke/which-key.nvim",  opts = {} },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
    -- Color schemes
    {
        "Shatur/neovim-ayu",
        config = function()
            vim.cmd.colorscheme("ayu-mirage")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        opts = {},
    },
    -- End of color schemes
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.config.lualine")
        end,
        -- opts = require("plugins.config.lualine")
    },
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("plugins.config.indent-blankline")
        end,
    },
    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim", opts = {} },
    -- Fuzzy Finder (files, lsp, etc)
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Enable telescope fzf native, if installed
            require("telescope").load_extension("fzf")
            require("plugins.config.telescope")
        end,
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
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
        -- File tree
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins.config.nvim-tree")
        end,
    },
    -- Custom plugins
    {
        -- Dashboard
        "mhinz/vim-startify",
        config = function()
            require("plugins.config.vim_startify")
        end,
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
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)
            -- setup cmp for autopairs
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "hood/popui.nvim",
        config = function()
            require("plugins.config.popui")
        end,
    },
    -- {
    -- 	"rcarriga/nvim-notify",
    -- 	opts = require("plugins.config.notify").opts,
    -- 	config = function()
    -- 		vim.notify = require("notify")
    -- 	end,
    -- },
    -- {
    -- 	"mrded/nvim-lsp-notify",
    -- 	dependencies = {
    -- 		"rcarriga/nvim-notify",
    -- 	},
    -- 	config = function()
    -- 		require("lsp-notify").setup({})
    -- 	end,
    -- },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        version = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.config.bufferline")
        end,
    },
    "moll/vim-bbye",
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = require("plugins.config.toggleterm"),
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.config.neorg")
        end,
    },
    "elkowar/yuck.vim",
    {
        "edolphin-ydf/goimpl.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("telescope").load_extension("goimpl")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- {
    -- 	"dreamsofcode-io/ChatGPT.nvim",
    -- 	event = "VeryLazy",
    -- 	dependencies = {
    -- 		"MunifTanjim/nui.nvim",
    -- 		"nvim-lua/plenary.nvim",
    -- 		"nvim-telescope/telescope.nvim"
    -- 	},
    -- 	config = function()
    -- 		require("chatgpt").setup({
    -- 			async_api_key_cmd = "pass show api/tokens/openai",
    -- 		})
    -- 	end
    -- },
}, {})

require("plugins.config.lsp")
