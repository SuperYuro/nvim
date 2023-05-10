local lspsaga = require 'lspsaga'

local keymap = vim.keymap
local opts = { silent = true, noremap = true }

lspsaga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-n>',
    scroll_up = '<C-p>',
  },
  request_timeout = 5000,

  -- Async LSP Finder
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      -- jump_to = 'p',
      -- expand_or_jump = 'o',
      vsplit = 'v',
      split = 's',
      tabnew = 't',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },

  -- Code Action
  code_action = {
    num_shortcut = true, -- Select code_action by number
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = 'q',
      exec = '<CR>',
    },
  },
}

-- Following settings are based on nvim-lspconfig's default settings.
vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<CR>', opts)             -- definition
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)                    -- hover
vim.keymap.set('n', '<C-k>', ':Lspsaga signature_help<CR>', opts)           -- signature_help
vim.keymap.set('n', '<leader>D', ':Lspsaga goto_type_definition<CR>', opts) -- type_definition
vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts)              -- rename
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)         -- code_action
vim.keymap.set('v', '<leader>ca', ':Lspsaga range_code_action<CR>', opts)   -- code_action for selected buffer
vim.keymap.set('n', 'gr', ':Lspsaga lsp_finder<CR>', opts)                  -- references
