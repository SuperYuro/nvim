return {
    "folke/neodev.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    ft = { "lua" },
    config = function ()
        local capabilities = {
            require("cmp_nvim_lsp").default_capabilities()
        }

        require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })
    end
}
