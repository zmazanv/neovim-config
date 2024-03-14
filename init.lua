local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

require('options.keymaps')
require('options.options')
lazy.setup('plugins')
vim.keymap.set('n', '<Leader>lh', function()
  lazy.home()
end, { desc = '[L]azy [H]ome' })
