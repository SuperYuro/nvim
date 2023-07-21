local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")

mason_null_ls.setup({
  ensure_installed = {
    "stylua",
    "cpplint",
    "clang-format",
    -- "rustfmt",
    "jq",
  },
})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup({
  on_attach = on_attach,
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- Fish
    null_ls.builtins.diagnostics.fish,
    -- Bash
    null_ls.builtins.formatting.beautysh,
    -- Python
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    -- C/C++
    null_ls.builtins.diagnostics.cpplint,
    null_ls.builtins.formatting.clang_format,
    -- Rust
    null_ls.builtins.formatting.rustfmt,
    -- Json
    null_ls.builtins.formatting.jq,
    -- Prettier
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier,
  },
})

vim.keymap.set("n", "<Leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { silent = true, noremap = true })
