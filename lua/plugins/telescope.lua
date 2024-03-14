return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            -- Mappings for insert mode
            ["<C-g>"] = actions.close,
          },
          n = {
            -- Mappings for normal mode
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        oldfiles = {
          theme = "dropdown",
        },
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>rg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>of", "<cmd>Telescope oldfiles<cr>", desc = "Telescope old files" },
    { "<leader>dg", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostics" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Telescope git commits" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Telescope git branches" },
    { "<leader>ts", "<cmd>Telescope treesitter<cr>", desc = "Telescope treesitter" },
  },
}
