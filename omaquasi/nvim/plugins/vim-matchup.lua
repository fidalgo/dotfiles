return {
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			-- Optional configuration for offscreen matching
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			matchup = { enable = true }, -- Enable vim-matchup integration with Treesitter
		},
	},
}
