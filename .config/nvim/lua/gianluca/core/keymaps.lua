local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Set Explorer remap
vim.keymap.set("n", "<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- Set J and K to move rows up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

--- Keep selection active when indenting/unindenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

--- Set page jumping to keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--- Set seraching to keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Apply no highlight with <C-c>
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Paste without replacing clipbopard content
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "p", '"_dP', opts)

-- Delete without copying
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--- Set formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--- Disable capital Q
vim.keymap.set("n", "Q", "<nop>")

-- Set x to delete characters without copyng to clipboard
vim.keymap.set("n", "x", '"_x', opts)

--- Set the replacing on the word I'm on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace the word the cursor is on globally" })

--- Set the current file as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Makes file executable" })

-- Tab options
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current tab in new tab" })

-- Split options
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })
