return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        auto_install = true,
        --ensure_installed = { "lua", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
