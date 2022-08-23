local keymap = vim.keymap

vim.g.mapleader = '<Space>'

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Keep selection active when indenting/unindenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Make U a redo
keymap.set('n', 'U', '<C-r>')

-- Make K more consistent with J (J = join, K = split)
keymap.set('n', 'K', 'i<CR><Esc>k$')

-- Disable pageUp and pageDown keys (bad position on my keyboard)
keymap.set('n', '<PageUp>', 'Left')
keymap.set('n', '<PageDown>', 'Right')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
