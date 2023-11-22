local M = {}

local rc_file_exists = require("conform-selector.rc-file-exists").rc_file_exists

local prettier_rc_files = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.js",
  "prettier.config.js",
  ".prettierrc.mjs",
  "prettier.config.mjs",
  ".prettierrc.cjs",
  "prettier.config.cjs",
  ".prettierrc.toml",
}

local biome_rc_files = {
  "biome.json",
}

local tailwind_rc_files = {
  "tailwind.config.js",
  "tailwind.config.mjs",
}

M.formatters = function()
  local formatters = {}

  if rc_file_exists(prettier_rc_files) then
    table.insert(formatters, "prettierd")
  end

  if rc_file_exists(biome_rc_files) then
    table.insert(formatters, "biome")
  end

  if rc_file_exists(tailwind_rc_files) then
    table.insert(formatters, "rustywind")
  end

  return formatters
end

return M