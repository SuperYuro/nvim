local builtins = require("conform-selector.builtins")
local js_formatters = builtins.javascript.formatters()

return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },

      lua = { "stylua" },

      html = js_formatters,
      css = js_formatters,
      javascript = js_formatters,
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
      svelte = js_formatters,
      astro = js_formatters,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
