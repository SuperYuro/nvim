return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- ESLint
        null_ls.builtins.diagnostics.eslint.with({
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
            })
          end,
        }),

        -- Python
        null_ls.builtins.diagnostics.flake8,
      },
    })
  end,
}
