local biome_rc_files = {
  "biome.json",
}

local eslint_rc_files = {
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
}

local eslint_linter = "eslint_d"
local biome_linter = "biome"

local rc_file_exists = require("conform-selector.rc-file-exists").rc_file_exists

local js_linter = function()
  if rc_file_exists(eslint_rc_files) then
    return { eslint_linter }
  end

  if rc_file_exists(biome_rc_files) then
    return { biome_linter }
  end

  return nil
end

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("lint").linters_by_ft = {
      python = { "flake8" },

      javascript = js_linter,
      javascriptreact = js_linter,
      typescript = js_linter,
      typescriptreact = js_linter,
      svelte = js_linter,
      astro = js_linter,
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
