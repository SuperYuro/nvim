local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      hidden = {
        file_browser = true,
        folder_browser = true,
      },
    },
    emoji = {
      action = function(emoji)
        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
        vim.api.nvim_put({ emoji.value }, "c", false, true)
      end,
    },
    aerial = {
      show_nesting = {
        ["_"] = false,
        json = true,
        yaml = true,
      },
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("software-licenses")
telescope.load_extension("emoji")
telescope.load_extension("env")
telescope.load_extension("aerial")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "sf", ":Telescope file_browser<CR>", opts)
vim.keymap.set("n", "sr", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "sb", ":Telescope buffers<CR>", opts)
-- vim.keymap.set("n", "st", ":Telescope help_tags<CR>", opts)
-- vim.keymap.set("n", "s;", ":Telescope resume<CR>", opts)
vim.keymap.set("n", "sd", ":Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "se", ":Telescope env<CR>", opts)
vim.keymap.set("n", "st", ":Telescope aerial<CR>", opts)
vim.keymap.set("n", "sw", ":Telescope software-licenses find<CR>", opts)
