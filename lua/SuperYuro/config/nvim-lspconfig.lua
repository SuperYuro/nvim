local lspconfig = require 'lspconfig'
local mason = require 'mason'
local mason_lsp = require 'mason-lspconfig'

mason.setup()
mason_lsp.setup {
  ensure_installed = {
    'clangd',
    'jdtls',
    'rust_analyzer',
    'lua_ls',
    'pyright',
    'dockerls',
    'docker_compose_language_service',
    'tsserver',
    'svelte',
    'tailwindcss',
    'prismals',
  },
}

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
  end
end

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lsp.setup_handlers {
  function(server_name)
    if server_name == 'clangd' then
      lspconfig['clangd'].setup {
        on_attach = on_attach,
        capabilities = { cmp_capabilities, offsetEncoding = 'utf-8' },
      }
    else
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = cmp_capabilities,
      }
    end
  end,
}

-- Global mappings.
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
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
  end,
})
