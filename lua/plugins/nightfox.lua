local opts = {
  options = {
    inverse = {
      visual = true,
    },
  },
}

return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup(opts)
    vim.cmd("colorscheme nordfox")
  end,
}
