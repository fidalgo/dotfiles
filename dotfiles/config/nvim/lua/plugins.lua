-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use {		'maxmx03/solarized.nvim',
  config = function ()
    local success, solarized = pcall(require, 'solarized')
    vim.o.background = 'dark'
    solarized:setup {
      config = {
        theme = 'neovim',
        transparent = false
      }
    }
    vim.cmd 'colorscheme solarized'
  end
}
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) -- we're not migrating from v1.x version
use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
}
-- extendable fuzzy finder over lists
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.standardrb,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.standardrb,
	null_ls.builtins.formatting.erb_lint,
        null_ls.builtins.formatting.tidy,
      },
    })

  end,
  requires = { "nvim-lua/plenary.nvim" },
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- nvim-cmp: completion engine plugin TODO: Will need to figure out on how to install the requirements first
-- use 'neovim/nvim-lspconfig'
-- use 'hrsh7th/cmp-nvim-lsp'
-- use 'hrsh7th/cmp-buffer'
-- use 'hrsh7th/cmp-path'
-- use 'hrsh7th/cmp-cmdline'
-- use 'hrsh7th/nvim-cmp'


end)
