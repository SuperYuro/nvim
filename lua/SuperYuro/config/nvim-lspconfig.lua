local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup()
mason_lsp.setup({
  ensure_installed = {
    "jdtls",
    "rust_analyzer",
    "lua_ls",
    "pyright",
    "dockerls",
    "docker_compose_language_service",
    "tsserver",
    "svelte",
    "tailwindcss",
    "prismals",
  },
})

-- local on_attach = function(client)
--   if client.resolved_capabilities.document_formatting then
--     vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
--   end
-- end

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.clangd.setup({
  capabilities = { cmp_capabilities, offsetEncoding = "utf-8" },
})

mason_lsp.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = cmp_capabilities,
    })
  end,
})

-- Global mappings.
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
  end,
})

local signs = {
  Error = " ",
  Warn = " ",
  Hint = "󰌶 ",
  Info = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    source = "always", -- Or "if_many"
  },
})
