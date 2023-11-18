return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        enable = true,
      },
    },
    "HiPhish/nvim-ts-rainbow2",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",

      highlight = {
        enable = true,
      },
      rainbow = { enable = true }, -- nvim-ts-rainbow2
    })
  end,
}
