vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.fileformat = 'unix'
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set highlight on search.
vim.opt.hlsearch = true
-- Enable line numbering.
vim.opt.number = true
-- Enable relative line numbering.
vim.opt.relativenumber = true
-- Enable mouse support for all modes.
vim.opt.mouse = 'a'
-- Enable break indent.
vim.opt.breakindent = true
-- Save undo history.
vim.opt.undofile = true
-- Case-insensitive unless \c or capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default always.
vim.opt.signcolumn = 'yes'
-- Lower idle time for the swap file to be written to disk.
vim.opt.updatetime = 250
-- Lower time waited for mapped sequence to complete.
vim.opt.timeoutlen = 300
-- Set completeout to have a better completion experience.
vim.opt.completeopt = 'menuone,noselect'
-- Enable 24-bit RGB color.
vim.opt.termguicolors = true

vim.opt.foldlevel = 20
