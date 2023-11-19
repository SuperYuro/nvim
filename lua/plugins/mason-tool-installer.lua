return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      -- Formatters
      "stylua",
      -- Linters
      -- Dap
      "debugpy",
    },
    auto_update = true,
    run_on_start = true,
  },
}
