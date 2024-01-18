return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = { { "yioneko/nvim-yati", tag = "*" } },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      highlight = { enable = true },
      yati = {
        enable = true,
        default_lazy = true,
      },
      indent = { enable = false },
    })
  end,
}
