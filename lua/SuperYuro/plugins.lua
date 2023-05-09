local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use({
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = true
            vim.g.nord_italic = true
            vim.cmd [[colorscheme nord]]
        end
    })

    -- Jump anywhere
    use({
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup()
            vim.keymap.set("n", "<space><space>", ":HopWord<CR>", { silent = true, noremap = true })
        end,
    })

    -- File tree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                filters = {
                    dotfiles = true,
                }
            })
            vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { silent = true })
        end
    }

    -- Notify daemon
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("SuperYuro.config.noice")
        end,
    })

    -- Show lsp progress
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    })

    -- Show next key
    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({})
        end,
    })

    -- Show scrollbar
    use({
        "petertriho/nvim-scrollbar",
        requires = {
            "lewis6991/gitsigns.nvim",
            "kevinhwang91/nvim-hlslens",
        },
        config = function()
            require("hlslens").setup()
            require("gitsigns").setup()
            require("scrollbar").setup()
        end,
    })

    -- Fold lines

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim", -- File browser
            "chip/telescope-software-licenses.nvim",      -- Search Software License
            "xiyaowong/telescope-emoji.nvim",             -- Search emoji
            "fcying/telescope-ctags-outline.nvim",        -- Get outline
            "LinArcX/telescope-env.nvim",                 -- Show environment variables
        },
        config = function()
            require("SuperYuro.config.telescope")
        end,
    })

    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "nord"
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            path = 1,
                        },
                    },
                    lualine_x = { "fileformat", "filetype" },
                    lualine_y = { "diagnostics", "diff" },
                    lualine_z = { "progress", "location" },
                },
            })
        end,
    })

    -- Tabbar
    use({
        "akinsho/bufferline.nvim",
        config = function()
            local bufferline = require("bufferline")
            local highlights = require('nord').bufferline.highlights {
                italic = true,
                bold = true,
                fill = "#181c24"
            }
            bufferline.setup({
                highlights = highlights,
                options = {
                    mode = "tabs",
                    themable = true,
                    numbers = "buffer_id",
                    close_command = "bdelete! %d",
                    buffer_close_icon = "󰅖",
                    modified_icon = "●",
                    close_icon = "",
                    left_trunc_marker = "",
                    right_trunc_marker = "",
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = true,
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    separator_style = "slant",
                    always_show_bufferline = true,
                },
            })
            vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })
        end,
    })

    -- Syntax Highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "windwp/nvim-ts-autotag",         -- Pair HTML tags automatically
            "mrjones2014/nvim-ts-rainbow",    -- Rainbow brackets
            "RRethy/nvim-treesitter-endwise", -- Complete end automatically
        },
        config = function()
            require("SuperYuro.config.treesitter")
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        requires = {
            {
                "williamboman/mason.nvim",
                run = ":MasonUpdate",
            },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            require("SuperYuro.config.nvim-lspconfig")
        end,
    })

    -- LSP UI
    use({
        "glepnir/lspsaga.nvim",
        -- opt = true,
        branch = "main",
        -- event = "LspAttach",
        config = function()
            require("SuperYuro.config.lspsaga")
        end,
    })

    -- Diagnostics
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
    })

    -- Debag adapter protocol
    use({
        "mfussenegger/nvim-dap",
        config = function()
            require("SuperYuro.config.nvim-dap")
        end,
    })

    -- Format and Lint
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("SuperYuro.config.null-ls")
        end,
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "onsails/lspkind.nvim",                 -- Icons
            "hrsh7th/cmp-nvim-lsp",                 -- from LSP
            "hrsh7th/cmp-buffer",                   -- from Buffer
            "hrsh7th/cmp-path",                     -- from file path
            "hrsh7th/cmp-cmdline",                  -- Complete command line
            "hrsh7th/cmp-vsnip",                    -- from snippet
            "hrsh7th/vim-vsnip",                    -- from snippet
            "hrsh7th/cmp-nvim-lsp-document-symbol", -- from document symbol
            "hrsh7th/cmp-nvim-lsp-signature-help",  -- from signatures
        },
        config = function()
            require("SuperYuro.config.completions")
        end,
    })

    -- Git
    use {
        "ttbug/tig.nvim",
        config = function()
            require("tig").setup({
                -- Command Options
                command = {
                    -- Enable :Tigui command
                    -- @type: bool
                    enable = true,
                },
                -- Path to binary
                -- @type: string
                binary = "tig",
                -- Argumens to tig
                -- @type: table of string
                args = {},
                -- WIndow Options
                window = {
                    options = {
                        -- Width window in %
                        -- @type: number
                        width = 90,
                        -- Height window in %
                        -- @type: number
                        height = 80,
                        -- Border Style
                        -- Enum: "none", "single", "rounded", "solid" or "shadow"
                        -- @type: string
                        border = "rounded",
                    },
                },
            })
            vim.keymap.set("n", "tig", ":Tigui<CR>", { silent = true })
        end
    }

    -- Color preview
    use({
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                RGB = true,
                RRGGBB = true,
                RRGGBBAA = false,
                AARRGGBB = false,
                names = false,

                rgb_fn = false,
                hsl_fn = false,
                css = false,
                css_fn = false,

                tailwind = true,

                mode = "background",
            })
        end,
    })

    -- Highlight same words
    use({
        "RRethy/vim-illuminate",
        config = function()
            require("SuperYuro.config.illuminate")
        end,
    })

    -- Show indent line
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = true,
            })
        end,
    })

    -- Create missing directories when saving files
    use({
        "jghauser/mkdir.nvim",
    })

    -- Surround
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end,
    })

    -- Pair brackets automatically
    use({
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    })

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Interactive interface for json
    use({
        "gennaro-tedesco/nvim-jqx",
        ft = { "json", "yaml" },
    })

    -- Auto pandoc
    use({
        "jghauser/auto-pandoc.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("auto-pandoc")
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
