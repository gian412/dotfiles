vim.cmd("let g:newtrw_banner = 0")

--vim.opt.guicursor = ""

-- Set line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Set undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Set search and highlight
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set colors
vim.opt.termguicolors = true
--vim.opt.backgroud = "dark"

-- Set scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Set backspace
vim.opt.backspace = {"start", "eol", "indent"}

-- Set split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set file name
vim.opt.isfname:append("@-@")

-- Set update time
vim.opt.updatetime = 50

-- Set color column
vim.opt.colorcolumn = "80"

-- Set clipboard behaviour
vim.opt.clipboard:append("unnamedplus")

-- Set mouse behaviour
vim.opt.mouse = "a"

-- Set editor config
vim.g.editorconfig = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

