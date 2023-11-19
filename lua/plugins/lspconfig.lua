local ensure_installed = {
  "lua_ls",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      automatic_installation = false,
    })

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler (optional)
        local on_attach = nil
        local capabilities = { require("cmp_nvim_lsp").default_capabilities() }

        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      end,
    })
  end,
}
