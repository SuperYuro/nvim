local actions = require 'telescope.actions'
local telescope = require 'telescope'

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
      },
    },
  },
  extensions = {
    ctags_outline = {
      -- ctags option
      ctags = { 'ctags' },
      -- ctags filesystem option
      ft_opt = {
        vim = '--vim-kinds=fk',
        lua = '--lua-kinds=fk',
      },
    },
    emoji = {
      action = function(emoji)
        vim.fn.setreg('*', emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    },
  },
}

telescope.load_extension 'software-licenses'
telescope.load_extension 'emoji'
telescope.load_extension 'ctags_outline'
telescope.load_extension 'env'

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'sr', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', 'sb', ':Telescope buffers<CR>', opts)
-- vim.keymap.set("n", "st", ":Telescope help_tags<CR>", opts)
-- vim.keymap.set("n", "s;", ":Telescope resume<CR>", opts)
vim.keymap.set('n', 'sd', ':Telescope diagnostics<CR>', opts)
vim.keymap.set('n', 'se', ':Telescope env<CR>', opts)
vim.keymap.set('n', 'st', ':Telescope ctags_outline outline<CR>', opts)
vim.keymap.set('n', 'sw', ':Telescope software-licenses find<CR>', opts)
