local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ---- Look and feel ----

  -- Colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        commentStyle = { italic = true },
        transparent = true,
        dimInactive = true,
        terminalColors = true,
        theme = "dragon",
        colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
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
        inactive_sections = {
          lualine_c = { "filename" },
        },
        tabline = {
          lualine_a = {
            {
              "tabs",
              mode = 1,
              use_mode_colors = false,
              tabs_color = {
                active = "lualine_a_normal",
                inactive = "lualine_a_inactive",
              },
            },
          },
        },
      })
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "mrjones2014/nvim-ts-rainbow",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        endwise = {
          enable = true,
        },
      })
      require("nvim-ts-autotag").setup()
      if vim.fn.has("win32") == 1 then
        local tsintall = require("nvim-treesitter.install")
        tsintall.prefer_git = false
        tsintall.compilers = { "clang", "gcc" }
      end
    end,
  },

  -- Git status
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = true,
  },

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "kevinhwang91/nvim-hlslens",
    },
    config = true,
  },

  -- Highlight same words
  {
    "RRethy/vim-illuminate",
    config = function()
      require("SuperYuro.config.illuminate")
    end,
  },

  -- Show indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("SuperYuro.config.nvim-tree")
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "chip/telescope-software-licenses.nvim", -- Search Software License
      "xiyaowong/telescope-emoji.nvim", -- Search emoji
      "fcying/telescope-ctags-outline.nvim", -- Get outline
      "LinArcX/telescope-env.nvim", -- Show environment variables
    },
    config = function()
      require("SuperYuro.config.telescope")
    end,
  },

  ---- LSP support ----

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", run = ":MasonUpdate" },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("SuperYuro.config.nvim-lspconfig")
    end,
  },

  -- Rich LSP ui
  {
    "glepnir/lspsaga.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "LspAttach",
    branch = "main",
    config = function()
      require("SuperYuro.config.lspsaga")
    end,
  },

  -- Lsp Diagnostics'
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    confug = function()
      require("SuperYuro.config.trouble")
    end,
  },

  -- Show progress of LSP analysis
  {
    "j-hui/fidget.nvim",
    config = true,
  },

  -- Format and Lint
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("SuperYuro.config.null-ls")
    end,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("SuperYuro.config.nvim-dap")
    end,
  },

  ---- Language support ----
  -- Neovim Lua
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
    end,
  },

  ---- Editing support ----
  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "onsails/lspkind.nvim", -- Icons
      "hrsh7th/cmp-nvim-lsp", -- from LSP
      "hrsh7th/cmp-buffer", -- from Buffer
      "hrsh7th/cmp-path", -- from file path
      "hrsh7th/cmp-cmdline", -- Complete command line
      "hrsh7th/cmp-vsnip", -- from snippet
      "hrsh7th/vim-vsnip", -- from snippet
      "hrsh7th/cmp-nvim-lsp-document-symbol", -- from document symbol
      "hrsh7th/cmp-nvim-lsp-signature-help", -- from signatures
    },
    config = function()
      require("SuperYuro.config.completions")
    end,
  },

  -- Toggle comment
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- Close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },

  -- Surround brackets
  {
    "kylechui/nvim-surround",
    config = true,
  },

  -- Jump anywhere
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = { { "<Space>", mode = "n" } },
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "<Space><Space>", ":HopWord<CR>", { silent = true, noremap = true })
    end,
  },

  ---- Other utilities
  -- Git integration
  {
    "tpope/vim-fugitive",
    keys = { { "g", mode = "n" } },
    config = function()
      vim.keymap.set("n", "g<space>", ":Git ")
    end,
  },

  -- Git blame in buffer
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_message_template = "<summary> by <author> (<date>)"
      vim.g.gitblame_message_when_not_committed = ""
      vim.g.gitblame_date_format = "%r"
    end,
  },

  -- Git conflict editor
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },

  -- Original plugin
  {
    "SuperYuro/django-runner.nvim",
    branch = "feature/show-message",
    config = function()
      require("django-runner").setup()
    end,
  },
})
