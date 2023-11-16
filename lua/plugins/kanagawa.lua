return function()
    require("kanagawa").setup({
        compile = true,
        undercurl = true,
        commentstyle = {
            italic = true,
        },
        transparent = false,
        dimInactive = true,
        terminalColors = true,
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none",
                    },
                },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            return {
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3, },
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, },
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
            }
        end,
        theme = "wave",
    })
    vim.cmd("colorscheme kanagawa")
end
