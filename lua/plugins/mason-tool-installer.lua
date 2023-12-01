return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      -- Formatters
      "stylua",
      "clang-format",
      "prettierd",
      "rustywind",

      "black",
      "isort",

      "jq",
      "yamlfmt",

      -- Linters
      "flake8",
      "yamllint",
    },
    auto_update = true,
    run_on_start = true,
  },
}
