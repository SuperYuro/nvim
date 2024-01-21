return {
  "NeogitOrg/neogit",
  keys = {
    { "g<space>", "<cmd>Neogit kind=auto<cr>", desc = "Launch neogit" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
}
