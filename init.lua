vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("SuperYuro.base")
require("SuperYuro.maps")
require("SuperYuro.plugins")
require("SuperYuro.clipboard")

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has("mac")
local is_win = has("win32")
local is_linux = has("linux")

if is_linux then
  vim.opt.shell = "fish"
  vim.opt.fileformats = "unix,dos"
end

if is_win then
  vim.opt.shell = "pwsh"
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
  vim.opt.fileformats = "dos,unix"
end
