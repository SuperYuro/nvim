return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope file browser" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
        },
      },
    })
    telescope.load_extension("file_browser")
  end,
}
