return {
  "yioneko/nvim-yati",
  tag = "*",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup({})
  end,
}
