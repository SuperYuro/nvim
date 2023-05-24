local null_ls = require 'null-ls'

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- you can reuse a shared lspconfig on_attach callback here
local on_attach = function(client, bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr, async = false }
      end,
    })
  end
end

null_ls.setup {
  on_attach = on_attach,
  sources = {
    -- Bash
    null_ls.builtins.formatting.beautysh,
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- Fish
    null_ls.builtins.diagnostics.fish,
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
    null_ls.builtins.formatting.prettierd,
  },
}

vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, { silent = true, noremap = true })
