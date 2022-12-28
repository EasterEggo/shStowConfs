local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print 'Installing packer close and reopen Neovim...'
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
 ]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

-- Install your plugins here
packer.startup(function(use)
	-- core
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'

	-- dashboard
	use 'goolord/alpha-nvim'

	-- fuzzy finder
	use({
		'nvim-telescope/telescope-media-files.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope.nvim',
	})

	-- lsp and completion
	use({
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',
		'neovim/nvim-lspconfig',
		'SmiteshP/nvim-navic',

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
	})

	-- utils
	use 'windwp/nvim-autopairs'
	use 'akinsho/toggleterm.nvim'
	use({ 'uga-rosa/ccc.nvim', branch = '0.7.2' })
	use 'lukas-reineke/indent-blankline.nvim'
	use 'folke/which-key.nvim'
	use 'numToStr/Comment.nvim'
	use 'phaazon/hop.nvim'
	use 'jghauser/mkdir.nvim'
	use 'ahmedkhalf/project.nvim'

	-- treesitter
	use({
		'p00f/nvim-ts-rainbow',
		{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	})

	-- colorschemes
	use({ 'catppuccin/nvim', as = 'catppuccin' })
	use 'RRethy/nvim-base16'

	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	-- status bar
	use 'feline-nvim/feline.nvim'

	-- tabs
	use 'akinsho/bufferline.nvim'

	-- note taking
	use 'mickael-menu/zk-nvim'
	use({
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	})

	-- debugging
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'jayp0521/mason-nvim-dap.nvim'

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

vim.cmd 'let g:gruvbox_material_background = "soft"'
vim.cmd 'colorscheme base16-gruvbox-material-dark-medium'
vim.g.mapleader = ' '
Opts = { noremap = true, silent = true }
Bind = vim.api.nvim_set_keymap

require 'user.config.cmp'
require 'user.config.lsp'
require 'user.config.feline'
require 'user.config.toggleterm'
require 'user.config.gitsigns'
require 'user.config.treesitter'
require 'user.config.other'
require 'user.config.bufferline'
require 'user.config.telescope'
