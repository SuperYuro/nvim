return {
  {

    "nvim-treesitter/nvim-treesitter",
    dependencies = { "yioneko/nvim-yati" },
    build = ":TSUpdate",
    lazy = false,
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = "all",
      highlight = { enable = true },
      yati = {
        enable = true,
        -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
        default_lazy = true,

        default_fallback = "asis",
      },
      indent = {
        enable = false, -- disable builtin indent module
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
