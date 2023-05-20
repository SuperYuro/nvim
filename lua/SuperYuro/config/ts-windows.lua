local tsinstall = require 'nvim-treesitter.install'

tsinstall.prefer_git = false
tsinstall.compilers = { 'clang', 'gcc' }
