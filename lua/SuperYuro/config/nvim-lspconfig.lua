local lspconfig = require 'lspconfig'
local mason = require 'mason'
local mason_lsp = require 'mason-lspconfig'

mason.setup()
mason_lsp.setup {
  ensure_installed = {
    'clangd',
    'rust_analyzer',
    'lua_ls',
    'pyright',
    'dockerls',
    'docker_compose_language_service',
    'tsserver',
    'svelte',
  },
}

local on_attach = function()
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format { async = false }
    end,
  })
end

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      -- on_attach = on_attach,
      -- capabilities = { cmp_capabilities, offsetEncoding = 'utf-8' },
      capabilities = cmp_capabilities,
    }
  end,
}

-- Global mappings.
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
