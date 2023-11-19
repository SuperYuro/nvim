return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
  },
  keys = {
    { "<F5>", require("dap").continue(), desc = "Continue debug" },
    { "<F9>", require("dap").toggle_breakpoint(), desc = "Toggle breakpoint" },
    { "<F10>", require("dap").step_over(), desc = "Step over" },
    { "<F11>", require("dap").step_into(), desc = "Step into" },
  },
  config = function()
    local dap = require("dap")

    -- Python
    dap.adapters.python = function(cb, config)
      if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
          type = "server",
          port = assert(port, "`connect.port` is required for a python `attach` configuration"),
          host = host,
          options = {
            source_filetype = "python",
          },
        })
      else
        cb({
          type = "executable",
          command = "path/to/virtualenvs/debugpy/bin/python",
          args = { "-m", "debugpy.adapter" },
          options = {
            source_filetype = "python",
          },
        })
      end
    end
  end,
}
