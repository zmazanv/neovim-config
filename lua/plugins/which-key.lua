return {
  { -- Show pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local which_key = require('which-key')

      which_key.register({
        ['<Leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<Leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<Leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<Leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
        ['<Leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<Leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<Leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },

        ['<Leader>l'] = { name = '[L]azy', _ = 'which_key_ignore' },
      })
    end,
    opts = {},
  },
}
