vim.g.mapleader = ' '

-- Don'y yank with x
vim.keymap.set('n', 'x', '"_x')

-- Exit terminal insert mode with Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
