return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
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
        null_ls.builtins.code_actions.statix,
        null_ls.builtins.diagnostics.todo_comments,
        null_ls.builtins.diagnostics.deadnix,
        null_ls.builtins.diagnostics.statix,
        null_ls.builtins.formatting.alejandra,
        -- null_ls.builtins.formatting.nixfmt,
        -- null_ls.builtins.formatting.nixpkgs_fmt,
        -- null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.shfmt.with({
          extra_args = {
            '--case-indent',
            '--indent=4',
          },
        }),
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.formatting.cmake_format,
      },
    })

    vim.keymap.set('n', '<Leader>ff', vim.lsp.buf.format, {})
  end,
}
