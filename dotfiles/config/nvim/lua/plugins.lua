-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself
	use("tenxsoydev/size-matters.nvim")
	use("maxmx03/solarized.nvim")
	use("nvim-lualine/lualine.nvim")
	use("wsdjeg/vim-fetch") -- open file at line and column
	use("lukas-reineke/lsp-format.nvim")
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
		tag = "0.1.6",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("nvim-pack/nvim-spectre") -- search panel for neovim
	-- Smart and Powerful commenting plugin for neovim
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- nvim-cmp: completion engine plugin
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- vsnip snippets
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("andymass/vim-matchup")
	use("tpope/vim-fugitive") -- Git integration
	use("stevearc/conform.nvim") -- Lightweight yet powerful formatter plugin for Neovim
end)
