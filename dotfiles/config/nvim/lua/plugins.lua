-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
  'jose-elias-alvarez/null-ls.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
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
