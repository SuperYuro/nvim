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

      -- Linters
    },
    auto_update = true,
    run_on_start = true,
  },
}
