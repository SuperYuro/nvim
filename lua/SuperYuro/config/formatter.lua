local util = require("formatter.util")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    vim.cmd("FormatWrite")
  end,
})

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    c = { require("formatter.filetypes.c").clangformat },
    cpp = { require("formatter.filetypes.cpp").clangformat },
    rust = { require("formatter.filetypes.rust").rustfmt },
    python = {
      require("formatter.filetypes.python").autopep8,
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    lua = { require("formatter.filetypes.lua").stylua },
    html = { require("formatter.filetypes.html").prettier },
    css = {
      require("formatter.filetypes.css").prettier,
      require("formatter.filetypes.css").eslint_d,
    },
    javascript = { require("formatter.filetypes.javascript").prettier },
    javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
    typescript = { require("formatter.filetypes.typescript").prettier },
    typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
    json = { require("formatter.filetypes.json").jq },
    yaml = { require("formatter.filetypes.yaml").prettier },
    fish = { require("formatter.filetypes.fish").fishindent },
  },
})
