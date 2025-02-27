-- Enable 'list' option for YAML files, showing hidden characters
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "yml" },
	callback = function()
		vim.opt_local.list = true
	end,
})
