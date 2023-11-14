vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.mouse = ""

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = "/etc/*,/usr/bin/*,/usr/share/*,/usr/src/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true -- Auto indent
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = false -- Wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*", "*/venv/*", "*/.venv/*" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Highlight settings
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- Keymaps
local opts = { silent = true, noremap = true }
local silents = { silent = true }

vim.g.mapleader = " "

-- Increment/Decrement
vim.keymap.set("n", "+", "<C-a>", opts)
vim.keymap.set("n", "-", "<C-x>", opts)

-- cursor manipulation like Emacs
vim.keymap.set("i", "<C-f>", "<Right>", silents)
vim.keymap.set("i", "<C-b>", "<Left>", silents)
vim.keymap.set("i", "<C-p>", "<Up>", silents)
vim.keymap.set("i", "<C-n>", "<Down>", silents)

vim.keymap.set("i", "<C-a>", "<Home>", silents)
vim.keymap.set("i", "<C-e>", "<End>", silents)

vim.keymap.set("i", "<A-f>", "<C-Right>", silents)
vim.keymap.set("i", "<A-b>", "<C-Left>", silents)

-- Split buffer
vim.keymap.set("n", "ss", ":split<CR>", opts)
vim.keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move windows
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- Tab
vim.keymap.set("n", "te", ":tabedit %<CR>", opts)
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")

-- Redo with shift+u
vim.keymap.set("n", "U", "<C-r>", opts)

-- Don'y yank with x
vim.keymap.set("n", "x", '"_x')

-- Kill q
vim.keymap.set("n", "q", ":w<CR>", opts)

-- Exit terminal insert mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
