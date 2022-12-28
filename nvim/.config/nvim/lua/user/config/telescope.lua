local telescope = require 'telescope'
require('telescope').setup({
	defaults = {
		prompt_prefix = ' ',
		layout_strategy = 'vertical',
	},
})
telescope.load_extension 'media_files'
telescope.load_extension 'file_browser'
telescope.load_extension 'zk'
telescope.load_extension 'projects'

Bind('n', '<leader>.', ':Telescope file_browser <CR>', Opts)
Bind('n', '<leader>tt', ':Telescope <CR>', Opts)
Bind('n', '<leader>tc', ':Telescope colorscheme <CR>', Opts)
Bind('n', '<leader>tg', ':Telescope live_grep <CR>', Opts)
Bind('n', '<leader>th', ':Telescope help_tags <CR>', Opts)
Bind('n', '<leader>tm', ':Telescope man_pages <CR>', Opts)
