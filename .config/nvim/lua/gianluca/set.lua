local vim = vim
local opt = vim.opt

-- Enable line number
opt.nu = true

-- Enable relative line number
opt.relativenumber = true

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Wrap
opt.wrap = false

-- Backup and swap
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/vim/undodir"
opt.undofile = true

-- Fix search
-- opt.hlsearch = false
-- opt.incsearch = false

-- Enhance colors
opt.termguicolors = true

-- Manage scrolling
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Misc
opt.updatetime = 50
opt.colorcolumn = "120"

-- Fold
opt.foldmethod = "syntax"

vim.g.mapleader= " "
