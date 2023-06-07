-- plugin configurations

-- Neotree keymaps
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) -- we're not migrating from v1.x version
vim.api.nvim_set_keymap('n', '<Leader>t', ':Neotree toggle<CR>', { noremap = true, silent = true })

require('lualine').setup()
--require'lspconfig'.ruby_ls.setup{}

local success, solarized = pcall(require, 'solarized')
vim.o.background = 'dark'
solarized:setup {
  config = {
    theme = 'neovim',
    transparent = false
  }
}
vim.cmd 'colorscheme solarized'

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.erb_lint,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.formatting.tidy,
    null_ls.builtins.formatting.htmlbeautifier,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.standardrb

    -- null_ls.builtins.diagnostics.rubocop.with({
    --   command = "bundle",
    --   args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
    -- }),
    -- null_ls.builtins.diagnostics.standardrb.with({
    --   command = "bundle",
    --   args = vim.list_extend({ "exec", "standardrb" }, null_ls.builtins.diagnostics.standardrb._opts.args),
    -- }),
    -- null_ls.builtins.formatting.rubocop.with({
    --   command = "bundle",
    --   args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
    -- }),
    -- null_ls.builtins.formatting.standardrb.with({
    --   command = "bundle",
    --   args = vim.list_extend({ "exec", "standardrb" }, null_ls.builtins.formatting.standardrb._opts.args),
    -- }),
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"ruby", "yaml", "javascript", "lua"},
  indent = { enable = true }
}

-- Set up nvim-cmp.
local cmp = require'cmp'
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
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Neotree
require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  follow_current_file = true,
  -- Fix for Nerd Fonts v3
  default_component_configs = {
    icon = {
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
    },
    git_status = {
      symbols = {
        renamed   = "󰁕",
        unstaged  = "󰄱",
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = "󰈙", hl = "Tag" },
      Namespace = { icon = "󰌗", hl = "Include" },
      Package = { icon = "󰏖", hl = "Label" },
      Class = { icon = "󰌗", hl = "Include" },
      Property = { icon = "󰆧", hl = "@property" },
      Enum = { icon = "󰒻", hl = "@number" },
      Function = { icon = "󰊕", hl = "Function" },
      String = { icon = "󰀬", hl = "String" },
      Number = { icon = "󰎠", hl = "Number" },
      Array = { icon = "󰅪", hl = "Type" },
      Object = { icon = "󰅩", hl = "Type" },
      Key = { icon = "󰌋", hl = "" },
      Struct = { icon = "󰌗", hl = "Type" },
      Operator = { icon = "󰆕", hl = "Operator" },
      TypeParameter = { icon = "󰊄", hl = "Type" },
      StaticMethod = { icon = '󰠄 ', hl = 'Function' },
    }
  }
})
-- Enf of fix for Nerd Fonts v3

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local lspconfig = require('lspconfig')
lspconfig.ruby_ls.setup{}
