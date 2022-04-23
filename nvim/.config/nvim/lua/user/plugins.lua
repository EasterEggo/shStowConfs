local fn = vim.fn

-- Automatically install packer
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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = true })
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

	-- git
	use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
	use 'lewis6991/gitsigns.nvim'

	-- tabs
	use 'akinsho/bufferline.nvim'

	-- dashboard
	use 'goolord/alpha-nvim'

	-- fuzzy finder
	use({
		{ 'nvim-telescope/telescope-media-files.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
	})

	-- LSP
	use({
		'hrsh7th/cmp-nvim-lsp',
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',

		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'saadparwaiz1/cmp_luasnip',
		'jose-elias-alvarez/null-ls.nvim',
	})

	-- file explorer
	use 'kyazdani42/nvim-tree.lua'

	-- modeline
	use 'feline-nvim/feline.nvim'

	-- themes
	use 'rebelot/kanagawa.nvim'
	use({
		'catppuccin/nvim',
		as = 'catppuccin',
	})

	--utils
	use 'windwp/nvim-autopairs'
	use 'akinsho/toggleterm.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'folke/which-key.nvim'
	use 'numToStr/Comment.nvim'

	--treesitter
	use({
		{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
		'p00f/nvim-ts-rainbow',
	})

	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
end)

require 'user.config.cmp'
require 'user.config.toggleterm'
require 'user.config.gitsigns'
require 'user.config.treesitter'
require 'user.config.bufferline'
require 'user.config.lsp'
require 'user.config.feline'

require('nvim-tree').setup()
require('colorizer').setup()
require('indent_blankline').setup({
	show_current_context = true,
	show_current_context_start = true,
})

require('nvim-autopairs').setup()
require('which-key').setup()
require('alpha').setup(require('alpha.themes.startify').config)
require('Comment').setup()
require('telescope').load_extension 'media_files'
require('neogit').setup()

vim.cmd 'colorscheme catppuccin'
