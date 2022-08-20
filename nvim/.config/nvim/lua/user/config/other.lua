local nvimTree = require 'nvim-tree'
local colorizer = require 'colorizer'
local indent_blankline = require 'indent_blankline'
local autopairs = require 'nvim-autopairs'
local whichKey = require 'which-key'
local alpha = require 'alpha'
local comment = require 'Comment'
local telescope = require 'telescope'

nvimTree.setup()
colorizer.setup()
indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
autopairs.setup()
whichKey.setup()
alpha.setup(require('alpha.themes.startify').config)
comment.setup()
require('telescope').setup({
	defaults = {
		prompt_prefix = " "
	},
	pickers = {
		find_files = {
			hidden = true,
			theme = 'dropdown',
		},
	},
})
telescope.load_extension 'media_files'
