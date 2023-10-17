local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local clang_format = formatters.shell({
  cmd = { "clang-format", "--assume-filename", "%" },
})

format_on_save.setup({
  exclue_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    c = clang_format,
    cpp = clang_format,

    cs = formatters.lsp,

    rust = formatters.lsp,

    lua = formatters.stylua,

    html = formatters.prettierd,
    css = formatters.prettierd,
    javascript = formatters.prettierd,
    javascriptreact = formatters.prettierd,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    svelte = formatters.prettierd,

    dart = formatters.lsp,

    python = formatters.black,

    yaml = formatters.lsp,
    json = formatters.jq,
    toml = formatters.lsp,
  },
})
