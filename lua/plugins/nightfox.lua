return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      styles = {
        comments = "italic",
        variables = "bold",
        functions = "bold,italic",
      },
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd("colorscheme nordfox")
  end,
}
