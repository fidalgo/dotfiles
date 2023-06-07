-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim' -- Packer can manage itself

  use  'maxmx03/solarized.nvim'
  use { 'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
}

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
  requires = { 'nvim-lua/plenary.nvim' }
}
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use {  "jose-elias-alvarez/null-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" }
}

use {  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use {
  'numToStr/Comment.nvim', -- Smart and Powerful commenting plugin for neovim
  config = function()
    require('Comment').setup()
  end
}
-- nvim-cmp: completion engine plugin TODO: Will need to figure out on how to install the requirements first
use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

-- vsnip snippets
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

use "windwp/nvim-autopairs"
use "andymass/vim-matchup"

use "github/copilot.vim"
end)
