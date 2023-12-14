return {
  "yioneko/nvim-yati",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  config = function(_, opts)
    require("nvim-treesitter.configs").setup({
      yati = {
        enable = true,
        default_lazy = true,
      },
      indent = {
        enable = false,
      },
    })
  end,
}
