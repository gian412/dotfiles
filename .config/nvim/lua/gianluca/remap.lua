local vim = vim
local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move objects and Split
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep selection active when indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

--
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Overwrite without losing the clipboard
keymap.set("x", "<leader>p", "\"_dP")

-- Paste from and into system clipboard
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

keymap.set("n", "<leader>a", "0")
keymap.set("n", "<leader>w", "^")
keymap.set("n", "<leader>e", "$")
keymap.set("i", "<C-a>", "<Esc>0i")
keymap.set("i", "<C-w>", "<Esc>^i")
keymap.set("i", "<C-e>", "<Esc>$a")

-- Ignore Q
keymap.set("n", "Q", "nop>")

-- Format
keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quickfix navigation
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the word under the cursor
keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

-- Split vertical (v) end horizontal (h)
keymap.set("n", "<leader>v", "<C-w>v")
keymap.set("n", "<leader>s", "<C-w>s")

-- Move through windows
keymap.set("n", "<leader>h", ":wincmd h<CR>")
keymap.set("n", "<leader>j", ":wincmd j<CR>")
keymap.set("n", "<leader>k", ":wincmd k<CR>")
keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Clear higlight
keymap.set("n", "<Esc>", ":nohl<CR>")
