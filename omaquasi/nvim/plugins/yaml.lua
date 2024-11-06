return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				yamlls = {
					settings = {
						yaml = {
							format = { enable = true, singleQuote = true },
							-- keyOrdering = true,
						},
					},
				},
			},
		},
	},
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
}
