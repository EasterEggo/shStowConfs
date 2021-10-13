require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	
	-- tabs
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
  
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
    		requires = 'kyazdani42/nvim-web-devicons'
	}
	
	-- modeline
	use({
  		"NTBBloodbath/galaxyline.nvim",
  		-- your statusline
  		config = function()
    		require("galaxyline.themes.eviline")
  		end,
  		-- some optional icons
  		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	})


	-- themes
	use 'rose-pine/neovim'

	use 'yamatsum/nvim-cursorline'
end)

require("galaxyline.themes.eviline")

-- vim commands
vim.cmd([[
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
 
set termguicolors
colorscheme rose-pine

let g:dashboard_default_executive ='telescope'
]])
