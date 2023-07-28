-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself
	use("tenxsoydev/size-matters.nvim")
	use("maxmx03/solarized.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})
	-- extendable fuzzy finder over lists
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

	use({ "nvim-lualine/lualine.nvim" })
	use({
		"numToStr/Comment.nvim", -- Smart and Powerful commenting plugin for neovim
		config = function()
			require("Comment").setup()
		end,
	})
	-- nvim-cmp: completion engine plugin
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- vsnip snippets
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("windwp/nvim-autopairs")
	use("andymass/vim-matchup")

	-- use copilot-lua and copilot-lua
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
end)
