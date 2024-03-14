return {
  "nvim-telescope/telescope-frecency.nvim",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>fq", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope frecency" },
  },
  config = function() require("telescope").load_extension("frecency") end,
}
