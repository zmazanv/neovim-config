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
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'csv',
          'diff',
          'dockerfile',
          'fish',
          'git_config',
          'git_rebase',
          'gitattributes',
          'gitcommit',
          'gitignore',
          'go',
          'html',
          'json',
          'jsonc',
          'java',
          'javascript',
          'lua',
          'make',
          'markdown_inline',
          'meson',
          'nasm',
          'nix',
          'python',
          'rust',
          'sql',
          'ssh_config',
          'terraform',
          'toml',
          'tsx',
          'typescript',
          'udev',
          'vimdoc',
          'vim',
          'xml',
          'yaml',
          'zig',
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
