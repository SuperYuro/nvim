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
  ----------------------------------------------------------------------
  --                          Look and feel                           --
  ----------------------------------------------------------------------

  -- Colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          dim_inactive = true,
          styles = {
            comment = "italic",
          },
          inverse = {
            visual = true,
          },
        },
      })
      vim.cmd("colorscheme nordfox")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          disabled_filetypes = {
            "NvimTree",
          },
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
      })
    end,
  },

  -- Tab bar
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true

      require("bufferline").setup({
        options = {
          mode = "tabs",
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "bdelete! %d",
          diagnostics = "nvim_lsp",
          show_duplicate_prefix = false,
          separator_style = "slant",
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
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
      "RRethy/nvim-treesitter-endwise",
      "yioneko/nvim-yati",
      "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-tree-docs",
      "s1n7ax/nvim-comment-frame",
      "stevearc/aerial.nvim", -- Generate outline
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "vim",
          "vimdoc",
          "lua",
          "python",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "dart",
          "json",
          "json5",
          "ini",
          "toml",
          "yaml",
          "rust",
          "markdown",
          "markdown_inline",
          "gitignore",
          "git_config",
          "git_rebase",
        },
        autotag = { enable = true },
        endwise = { enable = true },
        yati = { enable = true },
        indent = { enable = false },
        context_commentstring = { enable = true },
        tree_docs = { enable = true },
      })
      require("nvim-ts-autotag").setup()
      require("treesitter-context").setup({
        enable = true,
        max_linex = 0,
        min_window_height = 0,
        line_numbers = false,
        mode = "cursor",
      })
      require("nvim-comment-frame").setup({
        keymap = "<Leader>cc",
        multiline_keymap = "<Leader>cm",
      })
      require("aerial").setup({ keymaps = false })
      if vim.fn.has("win32") == 1 then
        local tsinstall = require("nvim-treesitter.install")
        tsinstall.prefer_git = false
        tsinstall.compilers = { "clang" }
      end
    end,
  },

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      { "lewis6991/gitsigns.nvim", config = true }, -- Show git status
      { "kevinhwang91/nvim-hlslens", config = true }, -- Highlight search results
    },
    config = true,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("SuperYuro.config.illuminate")
    end,
  },

  -- Highlight arguments
  {
    "m-demare/hlargs.nvim",
    config = true,
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
      "LinArcX/telescope-env.nvim", -- Show environment variables
    },
    config = function()
      require("SuperYuro.config.telescope")
    end,
  },

  ----------------------------------------------------------------------
  --                           LSP Support                            --
  ----------------------------------------------------------------------

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
    "nvimdev/lspsaga.nvim",
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
  { "j-hui/fidget.nvim", branch = "legacy", config = true },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("SuperYuro.config.conform")
    end,
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("SuperYuro.config.nvim-lint")
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

  ----------------------------------------------------------------------
  --                         Language Support                         --
  ----------------------------------------------------------------------

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

  -- Flutter/Dart
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

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
      "L3MON4D3/LuaSnip", -- from snippet
      "saadparwaiz1/cmp_luasnip", -- from snippet
      "hrsh7th/cmp-nvim-lsp-document-symbol", -- from document symbol
      "hrsh7th/cmp-nvim-lsp-signature-help", -- from signatures
      "ray-x/cmp-treesitter", -- from Treesitter
    },
    config = function()
      require("SuperYuro.config.completions")
    end,
  },

  -- Toggle comment
  { "numToStr/Comment.nvim", config = true },

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
  { "kylechui/nvim-surround", config = true },

  -- Jump anywhere
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = { { "<Leader>", mode = "n" } },
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "<Leader><Leader>", ":HopWord<CR>", { silent = true, noremap = true })
    end,
  },

  -- Highlight color
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        ["*"] = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
        },
      })
    end,
  },

  -- Configure tab width automatically
  { "zsugabubus/crazy8.nvim" },

  ----------------------------------------------------------------------
  --                         Other Utilities                          --
  ----------------------------------------------------------------------

  -- Git integration
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },

  -- Git blame in buffer
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_message_template = "<summary> by <author> (<date>)"
      vim.g.gitblame_message_when_not_committed = ""
      vim.g.gitblame_date_format = "%r"
    end,
  },

  -- Original plugin
})
