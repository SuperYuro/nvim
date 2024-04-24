return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "svelte",
      "astro",
      "vue",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = true,
  },
  {
    "monaqa/dial.nvim",
    keys = {
      { "+", function() require("dial.map").manipulate("increment", "normal") end, mode = { "n" } },
      { "-", function() require("dial.map").manipulate("decrement", "normal") end, mode = { "n" } },
      { "+", function() require("dial.map").manipulate("increment", "visual") end, mode = { "v" } },
      { "-", function() require("dial.map").manipulate("decrement", "visual") end, mode = { "v" } },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        },

        -- augends used when group with name `mygroup` is specified
        mygroup = {
          augend.integer.alias.decimal,
          augend.constant.alias.bool, -- boolean value (true <-> false)
          augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
        },
      })
    end,
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    keys = {
      { "f", "<cmd>HopWord<cr>", desc = "Hop word" },
    },
    opts = {},
  },
  {
    "Vigemus/iron.nvim",
    keys = {
      { "<leader>rs", "<cmd>IronRepl<cr>", desc = "IronRepl" },
      { "<leader>rr", "<cmd>IronRestart<cr>", desc = "IronRestart" },
      { "<leader>rf", "<cmd>IronFocus<cr>", desc = "IronFocus" },
      { "<leader>rh", "<cmd>IronHide<cr>", desc = "IronHide" },
    },
    config = function()
      -- Default config
      local iron = require("iron.core")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "fish" },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").bottom(40),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file = "<leader>sf",
          send_line = "<leader>sl",
          send_until_cursor = "<leader>su",
          send_mark = "<leader>sm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader>s<cr>",
          interrupt = "<leader>s<leader>",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
    end,
  },
}
