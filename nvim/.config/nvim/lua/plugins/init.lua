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
	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		config = function()
			-- require("java").setup()
		end,
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		},
	},
	{
		"saghen/blink.cmp",
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
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("plugins.config.lsnip")
		end,
	},
	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = require("plugins.config.gitsigns"),
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
			require("plugins.config.telescope-config")
		end,
	},
	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
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
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
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
			-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.config.bufferline")
		end,
	},
	"moll/vim-bbye",
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = require("plugins.config.toggleterm"),
	},
	"elkowar/yuck.vim",
	{
		"edolphin-ydf/goimpl.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
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
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("plugins.config.todo"),
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		version = "4.4.7",
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
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("plugins.config.ui-select")
		end,
	},
	-- {
	--     'nvim-java/nvim-java',
	--     dependencies = {
	--         'nvim-java/lua-async-await',
	--         'nvim-java/nvim-java-core',
	--         'nvim-java/nvim-java-refactor',
	--         'nvim-java/nvim-java-test',
	--         'nvim-java/nvim-java-dap',
	--         'MunifTanjim/nui.nvim',
	--         'neovim/nvim-lspconfig',
	--         'mfussenegger/nvim-dap',
	--         {
	--             'williamboman/mason.nvim',
	--             opts = {
	--                 registries = {
	--                     'github:nvim-java/mason-registry',
	--                     'github:mason-org/mason-registry',
	--                 },
	--             },
	--         }
	--     },
	-- },
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.config.conform")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons,
		config = function()
			require("plugins.config.markdown")
		end,
	},
	{ "folke/neodev.nvim", opts = {} },
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = require("plugins.config.avante"),
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}, {})

require("plugins.config.lsp")
