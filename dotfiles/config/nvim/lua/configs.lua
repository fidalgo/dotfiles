require('lualine').setup {
  options = {
    theme = 'solarized_dark'
  }
}

require("null-ls").setup {
  sources = {
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.spell,
    null_ls.builtins.formatting.tidy,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,

    null_ls.builtins.diagnostics.erb_lint,
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.formatting.standardrb,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop,
  },
}
