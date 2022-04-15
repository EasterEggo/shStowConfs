local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
   		"1",
    		"https://github.com/wbthomason/packer.nvim",
    		install_path,
  	}
  	print "Installing packer close and reopen Neovim..."
  	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
    	autocmd!
    	autocmd BufWritePost plugins.lua source <afile> | PackerSync
  	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
  	display = {
    	open_fn = function()
      		return require("packer.util").float { border = "rounded" }
    	end,
  	},
}
require'packer'.startup(function(use)

	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- tabs
	use 'akinsho/bufferline.nvim'

	-- dashboard
	use 'goolord/alpha-nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
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
	use 'nvim-lualine/lualine.nvim'

	-- themes
	use 'dracula/vim'
	use 'NTBBloodbath/doom-one.nvim'
	use "RRethy/nvim-base16"
	use "rebelot/kanagawa.nvim"

	--utils
	use 'windwp/nvim-autopairs'
	use 'tpope/vim-fugitive'
	use 'akinsho/toggleterm.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'lukas-reineke/indent-blankline.nvim'
	use "folke/which-key.nvim"
	use "numToStr/Comment.nvim"

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
require "user.config.bufferline"
require "user.config.lsp"

require'nvim-tree'.setup()
require'colorizer'.setup()

-- require('doom-one').setup({
--             cursor_coloring = false,
--             terminal_colors = false,
--             italic_comments = true,
--             enable_treesitter = true,
--             transparent_background = false,
--             pumblend = {
--                 enable = true,
--                 transparency_amount = 20,
--             },
--             plugins_integrations = {
--                 neorg = false,
--                 barbar = false,
--                 bufferline = true,
--                 gitgutter = false,
--                 gitsigns = true,
--                 telescope = true,
--                 neogit = false,
--                 nvim_tree = true,
--                 dashboard = false,
--                 startify = true,
--                 whichkey = true,
--                 indent_blankline = true,
--                 vim_illuminate = false,
--                 lspsaga = true,
--             },
--         })
--

require"indent_blankline".setup ({
    show_current_context = true,
    show_current_context_start = true,
})

require'nvim-autopairs'.setup()
require'which-key'.setup()
require'Comment'.setup()
require'lualine'.setup()
require'alpha'.setup(require'alpha.themes.startify'.config)

vim.cmd [[ colorscheme kanagawa]]
