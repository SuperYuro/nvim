return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = {
    options = {
      mode = "tabs",
      themable = true,
      numbers = "buffer_id",
      indicator = {
        style = "icon",
      },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          text_align = "center",
          separator = true,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icons = true,
      show_tab_indicators = false,
      show_duplicate_prefix = false,
      separator_style = "slant",
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      sort_by = "tabs",
    },
  },
}
