local ensure_installed = {
  "clangd",

  "rust_analyzer",

  "lua_ls",

  "dockerls",
  "docker_compose_language_service",

  "html",
  "cssls",
  "tsserver",
  "svelte",
  "astro",
  "tailwindcss",

  "taplo",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP Installer
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",

    -- Completion from LSP
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

    local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({

      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({
          capabilities = cmp_capabilities,
        })
      end,

      ["denols"] = function()
        lspconfig["denols"].setup({
          capabilities = cmp_capabilities,
          root_dir = lspconfig.util.root_pattern({ "deno.json", "deno.jsonc" }),
          init_options = {
            lint = true,
            unstable = true,
            suggest = {
              imports = {
                hosts = {
                  ["https://deno.land"] = true,
                  ["https://cdn.nest.land"] = true,
                  ["https://crux.land"] = true,
                },
              },
            },
          },
        })
      end,

      ["tsserver"] = function()
        lspconfig["tsserver"].setup({
          capabilities = cmp_capabilities,
          root_dir = lspconfig.util.root_pattern("package.json"),
        })
      end,

      ["clangd"] = function()
        cmp_capabilities.offsetEncoding = "utf-8"
        lspconfig["clangd"].setup({
          capabilities = cmp_capabilities,
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
