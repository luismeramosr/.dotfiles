return {
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["mhinz/vim-startify"] = {
		config = function()
			require("custom.plugins.vim_startify")
		end,
	},
	["simrat39/rust-tools.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.lsp.rust_tools")
		end,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["nvim-telescope/telescope-ui-select.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("custom.plugins.telescope_ui_select")
		end,
	},
	["windwp/nvim-ts-autotag"] = {
		ft = { "html", "typescriptreact" },
		after = "nvim-treesitter",
		config = function()
			local present, autotag = pcall(require, "nvim-ts-autotag")

			if present then
				autotag.setup()
			end
		end,
	},
	["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
		config = function()
			require("custom.plugins.cmp")
		end,
	},
}
