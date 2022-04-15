require'packer'.startup(function(use)

	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	
	-- tabs
	use 'akinsho/bufferline.nvim'
  
	-- dashboard
	use 'glepnir/dashboard-nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- autocomplete
	use{
		'hrsh7th/cmp-nvim-lsp',
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
	}
	
	-- file explorer
	use 'kyazdani42/nvim-tree.lua'
	
	-- modeline
	use 'feline-nvim/feline.nvim'

	-- themes
	use 'dracula/vim'
	
	--utils
	use 'windwp/nvim-autopairs'
	use 'akinsho/toggleterm.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'lukas-reineke/indent-blankline.nvim'
	use "folke/which-key.nvim"

	--treesitter
	use {
		'nvim-treesitter/nvim-treesitter', 
		'p00f/nvim-ts-rainbow',
		run = ':TSUpdate'}

	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	if PACKER_BOOTSTRAP then
    		require("packer").sync()
  	end
end)

require "user.config.cmp"
require "user.config.toggleterm"
require "user.config.gitsigns"
require "user.config.treesitter"
require "user.config.lsp"

require'nvim-tree'.setup()
require'colorizer'.setup()

require"indent_blankline".setup ({
    show_current_context = true,
    show_current_context_start = true,
})

require'bufferline'.setup({
	options = {
		offsets = {{
    			filetype = "NvimTree",
   			text = "",
   			text_align = "left"
		}}
	}
})

require'nvim-autopairs'.setup()

require'feline'.setup() -- TODO
require'which-key'.setup()
