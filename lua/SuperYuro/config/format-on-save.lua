local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local lsp_or_prettierd = { formatters.lsp, formatters.if_file_exists({
  pattern = { ".prettierrc", "prettierrc.*" },
  formatter = formatters.prettierd,
}), }

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
    rust = formatters.lsp,
    lua = formatters.stylua,
    sh = formatters.shfmt,
    dart = formatters.lsp,
    json = formatters.jq,
    html = lsp_or_prettierd,
    css = lsp_or_prettierd,
    javascript = lsp_or_prettierd,
    typescript = lsp_or_prettierd,
    typescriptreact = lsp_or_prettierd,
    astro = lsp_or_prettierd,
    svelte = lsp_or_prettierd,
    python = {
      formatters.black,
      -- formatters.isort
    },
    c = clang_format,
    cpp = clang_format,
  },
  run_with_sh = vim.fn.has("win32") ~= 1,
})

format_on_save.restore_cursors()
