-- config.lua
local success, solarized = pcall(require, 'solarized')

vim.o.background = 'dark'

solarized:setup {
  config = {
    theme = 'neovim',
    transparent = false
  }
}

vim.cmd 'colorscheme solarized'


require('lualine').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})



