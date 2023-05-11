require('nvim-tree').setup {
  sort_by = 'case_sensitive',
  filters = {
    dotfiles = true,
  },

  -- Focus buffer when file opened
  -- on_attach = function(bufnr)
  --   local function opts(desc)
  --     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  --   end
  --   local ok, api = pcall(require, 'nvim-tree.api')
  --   assert(ok, 'api module is not found')
  --   vim.keymap.set('n', '<CR>', api.node.open.tab_drop, opts 'Tab drop')
  -- end,
}
vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>', { silent = true })

-- Autoclose
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
      vim.cmd 'quit'
    end
  end,
})
