return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  dependencies = { "TheGLander/indent-rainbowline.nvim" },
  main = "ibl",
  opts = function(_, opts)
    return require("indent-rainbowline").make_opts(opts)
  end,
}
