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
        -- Autoinstall languages that are not installed. Defaults to false.
        auto_install = true,

        -- Languages to ensure are supported.
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

        -- Enable improved syntax highlighting.
        highlight = { enable = true },
        -- Enable improved indentation.
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-Space>',
            node_incremental = '<C-Space>',
            scope_selection = '<C-s>',
            node_decremental = '<M-Space>',
          },
        },

        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobject. Similar to targets.vim.
            lookahead = true,
            keymaps = {
              -- You can capture groups defined in textobjects.scm.
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
        },

        move = {
          enable = true,
          -- Whether to set jumps in the jumplist.
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ['<Leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<Leader>A'] = '@parameter.inner',
          },
        },
      })
    end,
  },
}
