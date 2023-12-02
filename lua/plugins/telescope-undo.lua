return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Telescope history" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {},
      },
    })
    require("telescope").load_extension("undo")
  end,
}
