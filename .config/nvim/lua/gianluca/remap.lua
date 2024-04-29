-- Set remaps

--- Open a vertical split and switch over (v)
-- vim.keymap.set("n", "<leader>v", "<C-w>v")

--- Open an horizontal split and switch over (s)
-- vim.keymap.set("n", "<leader>s", "<C-w>s")

--- Set Explorer remap
vim.keymap.set("n", "<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

--- Window commands
-- vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
-- vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
-- vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
-- vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--- Set move highlighted text remap
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- Keep selection active when indenting/unindenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--- Set Join
vim.keymap.set("n", "J", "mzJ`z")
--- Set page jumping to keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--- Set seraching to keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Set pasting to keep the pasted textinstead of the cutted one
vim.keymap.set("x", "<leader>p", [["_dP]])

--- Set yanking to yank in the sistem clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--- Set delete to go in the void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

--- Disable capital Q
vim.keymap.set("n", "Q", "<nop>")

--- Set formatting
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--- Set the replacing on the word I'm on
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--- Set the current file as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--- Set source of file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
