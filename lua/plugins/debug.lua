local debuggers = {
  "chrome",
  "js",
  "dart",
  "cppdbg",
  "codelldb",
  "python",
}

return {
  {

    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<C-F5>", function() require("dap").continue() end, desc = "Continue debug" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step into" },
    },
    config = function()
      local dap = require("dap")
      local mason_dap = require("mason-nvim-dap")

      mason_dap.setup({
        ensure_installed = debuggers,
        handlers = {
          function(config) mason_dap.default_setup(config) end,
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<F12>", function() require("dapui").toggle() end },
    },
    config = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = true,
  },
}
