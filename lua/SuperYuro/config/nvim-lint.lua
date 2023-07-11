local lint = require("lint")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

lint.linters_by_ft = {
  c = { "cpplint" },
  cpp = { "cpplint" },
  python = { "flake8" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  astro = { "eslint_d" },
  svelte = { "eslint_d" },
  json = { "jsonlint" },
  markdown = { "markdownlint" },
  yaml = { "yamllint" },
  fish = { "fish" },
}
