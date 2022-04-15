-- vim commands
vim.cmd([[
	set completeopt=menu,menuone,noselect
	set termguicolors nu
	colorscheme dracula
	let g:dashboard_default_executive = 'telescope'
]])

--plugins
require "user.plugins"

-- TODO bindings
local opts = {noremap = true, silent = true}
local bind = vim.api.nvim_set_keymap
bind("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
bind("n", "<leader>.", ":NvimTreeToggle <CR>", opts)
