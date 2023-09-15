require("conform").setup({
  format_on_save = {
    timeout_ms = 100,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },

    dart = { "dart_format" },

    sh = { "beautysh" },
    fish = { "fish_indent" },

    lua = { "stylua" },

    html = { "prettierd" },
    css = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    astro = { "prettierd" },

    python = { "black", "isort" },

    rust = { "rustfmt" },

    markdown = { "markdownlint" },

    json = { "jq" },
    yaml = { "yamlfmt" },
    toml = { "taplo" },
    xml = { "xmlformat" },

    ["*"] = { "trim_whitespace" },
  },
  log_level = vim.log.levels.WARN,
  notify_on_error = true,
})
