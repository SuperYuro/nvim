-- Groups are the highlight group definitions. The keys of this table are the name of the highlight
-- groups that will be overridden. The value is a table with the following values:
--   - fg, bg, style, sp, link,
--

local bg_dark = "bg2"
local fg_dark = "fg2"
local prompt = "bg0"

local groups = {
  all = {
    TelescopeNormal = {
      bg = bg_dark,
      fg = fg_dark,
    },
    TelescopeBorder = {
      bg = bg_dark,
      fg = bg_dark,
    },
    TelescopePromptNormal = {
      bg = prompt,
    },
    TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    },
    TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    },
    TelescopePreviewTitle = {
      bg = bg_dark,
      fg = bg_dark,
    },
    TelescopeResultsTitle = {
      bg = bg_dark,
      fg = bg_dark,
    },
  },
}

return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      inverse = {
        visual = true,
      },
    },
    groups = groups,
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd("colorscheme nordfox")
  end,
}
