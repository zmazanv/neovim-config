vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader><BS>', '<Esc>gg=G:w<CR>', { silent = true })
vim.keymap.set('', ',', ';')
vim.keymap.set('', ';', ',')
vim.keymap.set('', '@', 'q')
vim.keymap.set('', 'q', '@')
vim.keymap.set('', '+', 'm')
vim.keymap.set('', 'm', '`')
vim.keymap.set(
  'n',
  '<Leader>h',
  vim.cmd.nohlsearch,
  { desc = 'Clear highlighted', silent = true }
)
vim.keymap.set('n', '<Leader>/', '/\\c<Left><Left>')
vim.keymap.set('n', '<Leader>r', ':s//gc<Left><Left><Left>')
vim.keymap.set('n', '<Leader>R', ':s//g<Left><Left>')
vim.keymap.set('n', '<Leader>s', ':%s//gc<Left><Left><Left>')
vim.keymap.set('n', '<Leader>S', ':%s//g<Left><Left>')
vim.keymap.set('n', '<Leader>o', 'o<Esc>')
vim.keymap.set('n', '<Leader>O', 'O<Esc>')
vim.keymap.set('n', '<Leader>i', 'i<Space><Esc>')
vim.keymap.set('n', '<Leader>a', 'a<Space><Esc>')
vim.keymap.set('n', '<Leader>J', 'i<CR><Esc>')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')
vim.keymap.set(
  'n',
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)
vim.keymap.set(
  'n',
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)

-- Highlight yanked text on yank.
local highlight_group =
  vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
