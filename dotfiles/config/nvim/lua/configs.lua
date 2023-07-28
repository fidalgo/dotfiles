-- plugin configurations
require("lualine").setup()

local success, solarized = pcall(require, "solarized")
vim.o.background = "dark"
solarized:setup({
	config = {
		theme = "neovim",
		transparent = false,
	},
})
vim.cmd("colorscheme solarized")

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.erb_lint,
		null_ls.builtins.diagnostics.rubocop,
		--		null_ls.builtins.formatting.tidy,
		null_ls.builtins.formatting.htmlbeautifier,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.stylua,
	},
	-- format on save
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fs", builtin.grep_string, {})

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "ruby", "yaml", "javascript", "lua" },
	indent = { enable = true },
})

-- Set up nvim-cmp.
local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
	}, {
		{ name = "buffer" },
	}),
})
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Neotree
vim.api.nvim_set_keymap("n", "<Leader>t", ":Neotree toggle<CR>", { noremap = true, silent = true }) -- toggle
require("neo-tree").setup({
	popup_border_style = "rounded",
	enable_git_status = true,
	use_libuv_file_watcher = false,
	filesystem = {
		follow_current_file = { enabled = true },
	},
	buffers = {
		follow_current_file = { enabled = true },
	},
})

local lspconfig = require("lspconfig")
lspconfig.ruby_ls.setup({})
