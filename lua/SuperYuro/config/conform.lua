require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },

    rust = { "rustfmt" },

    lua = { "stylua" },

    sh = { "beautysh" },
    fish = { "fish_indent" },

    json = { "jq" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },

    markdown = { "markdownlint" },

    python = { "isort", "black" },

    dart = { "dart_format" },

    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd", "rustywind" },
    typescriptreact = { "prettierd", "rustywind" },
    astro = { "prettierd" },
    svelte = { "prettierd" },
  },
  format_on_save = {
    timeout_ms = 100,
    lsp_fallback = true,
  },
})
