local lspsaga = require 'lspsaga'

local keymap = vim.keymap.set
local opts = { silent = true }

lspsaga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  request_timeout = 5000,

  -- :Lspsaga lsp_finder
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = 'o',
      vsplit = 'v',
      split = 's',
      tabnew = 't',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
}
