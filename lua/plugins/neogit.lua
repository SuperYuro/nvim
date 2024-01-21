return {
  "NeogitOrg/neogit",
  keys = {
    { "g<space>", "<cmd>Neogit kind=tab<cr>", desc = "Launch neogit" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
}
