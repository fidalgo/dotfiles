return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			bundle_rubocop = {
				command = "rubocop",
				prepend_args = { "bundle", "exec" }, -- This adds "bundle exec" before "rubocop"
				timeout = 50000,
			},
			yarn_prettier = { command = "yarn run prettier" },
		},
		formatters_by_ft = {
			python = { "isort", "black" }, -- Conform will run multiple formatters sequentially
			javascript = { "yarn_prettier", "prettier", stop_after_first = true }, -- Use a sub-list to run only the first available formatter
			ruby = { "bundle_rubocop", "rubocop", stop_after_first = true },
			eruby = { "htmlbeautifier", "erb-format" },
			html = { "prettier" },
			json = { "prettier" },
		},
	},
}
