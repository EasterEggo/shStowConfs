require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	
	-- tabs
	use 'romgrk/barbar.nvim'
  
	-- dashboard
	use 'glepnir/dashboard-nvim'

	-- telescope, a popup menu to work with Dashboard
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	-- tetris
	use 'alec-gibson/nvim-tetris'
	
	-- file explorer
	use {
		'kyazdani42/nvim-tree.lua',
		config = function() require'nvim-tree'.setup {} end
	}
	
	-- modeline
	use 'nvim-lualine/lualine.nvim'


	-- themes
	use 'dracula/vim'

	use 'yamatsum/nvim-cursorline'
	use 'kyazdani42/nvim-web-devicons'
end)

require('lualine').setup()

-- vim commands
vim.cmd([[
set termguicolors
set nu
colorscheme dracula

let g:dashboard_default_executive = 'telescope'
]])
