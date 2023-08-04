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
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  astro = { "eslint" },
  svelte = { "eslint" },
  json = { "jsonlint" },
  markdown = { "markdownlint" },
  yaml = { "yamllint" },
  fish = { "fish" },
}
