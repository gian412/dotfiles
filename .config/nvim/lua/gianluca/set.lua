--  Set useful options

--- Set leader
vim.g.mapleader = " "

--- Set Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--- Set tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--- Set smart indent
vim.opt.smartindent = true

--- Set no wrap
vim.opt.wrap = false

--- Set undo history and tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--- Set search and highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

--- Set good colors
vim.opt.termguicolors = true

--- Set scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--- Set update time
vim.opt.updatetime = 50

--- Set color column
vim.opt.colorcolumn = "120"
