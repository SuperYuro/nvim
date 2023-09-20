local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local clang_format = formatters.shell({
  cmd = { "clang-format", "--assume-filename", "%" },
})

format_on_save.setup({
  experiments = {
    partial_update = "diff",
  },
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    c = clang_format,
    cpp = clang_format,
    rust = formatters.lsp,
    lua = formatters.stylua,
    sh = formatters.shfmt,
    dart = formatters.lsp,
    json = formatters.lsp,
    yaml = formatters.lsp,
    toml = formatters.lsp,
    html = formatters.prettierd,
    css = formatters.prettierd,
    javascript = formatters.prettierd,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    astro = formatters.prettierd,
    svelte = formatters.prettierd,
    python = {
      formatters.black,
      formatters.isort,
    },
  },
  -- run_with_sh = vim.fn.has("win32") ~= 1,
})

format_on_save.restore_cursors()
