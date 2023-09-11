local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
    }),
  },
  window = {
    -- completion=cmp.config.window.bordered(),
    -- documentation=cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-g>"] = cmp.mapping.abort(),
    ["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
  }, {
    { name = "luasnip" }, -- For luasnip users.
    { name = "buffer" },
    { name = "treesitter" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = "buffer" },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
