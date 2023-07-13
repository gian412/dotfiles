-- Enable line number
vim.opt.nu = true

-- Enable relative line number
vim.opt.relativenumber = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Wrap
vim.opt.wrap = false

-- Backup and swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/vim/undodir"
vim.opt.undofile = true

-- Fix search
-- vim.opt.hlsearch = false
-- vim.opt.incsearch = false

-- Enhance colors
vim.opt.termguicolors = true

-- Manage scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Misc
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.mapleader= " "

