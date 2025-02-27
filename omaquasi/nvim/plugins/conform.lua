return {
	"stevearc/conform.nvim",
	opts = {
		-- 		formatters = {
		-- 			rubocop = {
		-- 				command = "rubocop-bundler",
		-- 				args = {
		-- 					"-a",
		-- 					"-f",
		-- 					"quiet",
		-- 					"--stdin",
		-- 					"$FILENAME",
		-- 				},
		-- 			},
		-- 			-- 	-- 	yarn_prettier = { command = "yarn run prettier" },
		-- 		},
		formatters_by_ft = {
			python = { "isort", "black" }, -- Conform will run multiple formatters sequentially
			javascript = { "prettier" }, -- Use a sub-list to run only the first available formatter
			ruby = { "rubocop" },
			eruby = { "htmlbeautifier", "erb-format" },
			html = { "prettier" },
			json = { "prettier" },
		},
	},
}
