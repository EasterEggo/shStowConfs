local nvimTree = require 'nvim-tree'
local ccc = require 'ccc'
local indent_blankline = require 'indent_blankline'
local autopairs = require 'nvim-autopairs'
local whichKey = require 'which-key'
local alpha = require 'alpha'
local comment = require 'Comment'
local telescope = require 'telescope'
local zk = require 'zk'

nvimTree.setup()
zk.setup({ picker = 'telescope' })
indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
autopairs.setup()
whichKey.setup()
alpha.setup(require('alpha.themes.startify').config)
comment.setup()

ccc.setup({
	highlighter = { auto_enable = true },
})

require('telescope').setup({
	defaults = {
		prompt_prefix = ' ',
		layout_strategy = 'vertical',
	},
})
telescope.load_extension 'media_files'
telescope.load_extension 'file_browser'
telescope.load_extension 'zk'
