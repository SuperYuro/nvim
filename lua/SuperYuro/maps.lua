local opts = { silent = true, noremap = true }

vim.g.mapleader = ' '

-- Split buffer
vim.keymap.set('n', 'ss', ':split<CR>', opts)
vim.keymap.set('n', 'sv', ':vsplit<CR>', opts)

-- Move windows
vim.keymap.set('n', 'sh', '<C-w>h', opts)
vim.keymap.set('n', 'sj', '<C-w>j', opts)
vim.keymap.set('n', 'sk', '<C-w>k', opts)
vim.keymap.set('n', 'sl', '<C-w>l', opts)

-- Redo with shift+u
vim.keymap.set('n', 'U', '<C-r>', opts)

-- Don'y yank with x
vim.keymap.set('n', 'x', '"_x')

-- Exit terminal insert mode with Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
