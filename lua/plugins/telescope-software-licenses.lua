return {
  "chip/telescope-software-licenses.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function() require("telescope").load_extension("software-licenses") end,
}
