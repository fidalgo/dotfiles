-- plugin configurations
require("lualine").setup({
	sections = {
		lualine_c = { { "filename", path = 1, file_status = true } },
	},
})

local success, solarized = pcall(require, "solarized")
vim.o.background = "dark"
solarized:setup({
	config = {
		theme = "neovim",
		transparent = false,
	},
})
vim.cmd("colorscheme solarized")

local function detect_gems()
	local gemfile_path = vim.fn.getcwd() .. "/Gemfile"
	local gems = {}
	if vim.fn.filereadable(gemfile_path) == 1 then
		local gemfile_content = table.concat(vim.fn.readfile(gemfile_path), "\n")
		gems.standard = gemfile_content:match("gem [\"']standard%-") ~= nil
		gems.rubocop = gemfile_content:match("gem [\"']rubocop%-") ~= nil
	end
	return gems
end
local gems = detect_gems()

local null_ls = require("null-ls")
local builtins = {
	null_ls.builtins.diagnostics.codespell,
	null_ls.builtins.diagnostics.erb_lint,
	null_ls.builtins.diagnostics.tidy.with({
		extra_filetypes = { "eruby" },
		extra_args = { "--show-warnings false", "--show-body-only true" },
	}),
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
}
null_ls.setup({
	debug = true,
	sources = builtins,
	on_attach = require("lsp-format").on_attach,
})

if gems.rubocop then
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "ruby",
		callback = function()
			vim.lsp.start({
				name = "rubocop",
				cmd = { "bundle", "exec", "rubocop", "--lsp" },
			})
		end,
	})
	vim.notify_once([[Using Rubocop for Ruby LSP]], vim.log.levels.INFO)
else
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "ruby",
		callback = function()
			vim.lsp.start({
				name = "standardrb",
				cmd = { "bundle", "exec", "standardrb", "--lsp" },
			})
		end,
	})
	vim.notify_once([[Using Standard for Ruby LSP]], vim.log.levels.INFO)
end

require("lsp-format").setup({})
local lspconfig = require("lspconfig")
lspconfig.ruby_ls.setup({ on_attach = require("lsp-format").on_attach })
vim.opt.signcolumn = "yes"

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fs", builtin.grep_string, {})

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "ruby", "yaml", "javascript", "json", "markdown", "lua" },
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
