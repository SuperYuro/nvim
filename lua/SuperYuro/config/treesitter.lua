require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  endwise = {
    enable = true,
  },
}
require('nvim-ts-autotag').setup()
