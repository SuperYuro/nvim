local null_ls = require 'null-ls'

local on_attach = function()
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format { async = false }
    end,
  })
end

null_ls.setup {
  on_attach = on_attach,
  sources = {
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- Fish
    null_ls.builtins.diagnostics.fish,
    -- Python
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
}

vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, { silent = true, noremap = true })
