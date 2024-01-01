return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            '--call-parentheses=Always',
            '--collapse-simple-statement=Never',
            '--column-width=80',
            '--indent-type=Spaces',
            '--indent-width=2',
            '--line-endings=Unix',
            '--quote-style=AutoPreferSingle',
          },
        }),
        null_ls.builtins.formatting.prettier,
      },
    })

    vim.keymap.set('n', '<Leader>ff', vim.lsp.buf.format, {})
  end,
}
