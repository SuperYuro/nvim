local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  experiments = {
    partial_update = true,
  },
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    rust = formatters.lsp,
    lua = formatters.stylua,
    sh = formatters.shfmt,
  },
})
