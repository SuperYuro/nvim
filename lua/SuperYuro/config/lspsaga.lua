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

  -- UI customization
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = 'single',
    winblend = 0,
    expand = '',
    collapse = '',
    code_action = '💡',
    incoming = ' ',
    outgoing = ' ',
    hover = ' ',
    kind = {},
  },

  -- definition
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },

  -- hover
  hover = {
    max_width = 0.6,
    open_link = 'gx',
    open_browser = '!chrome',
  },

  -- type_definition

  -- rename
  rename = {
    quit = '<C-c>',
    exec = '<CR>',
    mark = 'x',
    confirm = '<CR>',
    in_select = true,
  },

  -- code_action
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = 'q',
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },

  -- references
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = 'o',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },

  -- outline
  outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    preview_width = 0.4,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      expand_or_jump = 'o',
      quit = 'q',
    },
  },
}

-- Following settings are based on nvim-lspconfig's default settings.
vim.keymap.set('n', '<leader>e', ':Lspsaga show_line_diagnostics<CR>', opts) -- diagnostics
vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<CR>', opts) -- definition
vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts) -- hover
vim.keymap.set('n', '<leader>D', ':Lspsaga goto_type_definition<CR>', opts) -- type_definition
vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts) -- rename
vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', opts) -- code_action
vim.keymap.set('v', '<leader>ca', ':Lspsaga range_code_action<CR>', opts) -- code_action for selected buffer
vim.keymap.set('n', 'gr', ':Lspsaga lsp_finder<CR>', opts) -- references
vim.keymap.set('n', '<C-o>', ':Lspsaga outline<CR>', opts) --outline
