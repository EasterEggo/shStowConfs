require 'user.config.lsp.require'
require 'user.config.lsp.navic'
require 'user.config.lsp.mason'
require 'user.config.lsp.dap'
require 'user.config.lsp.null-ls'
require 'user.config.lsp.handlers'.setup()
-- require 'user.config.lsp.settings'

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
