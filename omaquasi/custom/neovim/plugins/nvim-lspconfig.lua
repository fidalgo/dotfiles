-- https://shopify.github.io/ruby-lsp/editors.html#lazyvim-lsp

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rubocop = {
					mason = false,
					cmd = { "bundle", "exec", "rubocop" }, -- Use bundle exec for project isolation
				},
				ruby_lsp = {
					mason = false,
					cmd = { "bundle", "exec", "ruby-lsp" }, -- Use bundle exec for project isolation
				},
			},
		},
	},
}
