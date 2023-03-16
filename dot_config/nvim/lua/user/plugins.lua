local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup({
	-- core
	'kyazdani42/nvim-web-devicons',
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',

	-- dashboard
	'goolord/alpha-nvim',

	-- fuzzy finder
	'nvim-telescope/telescope-media-files.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
	'nvim-telescope/telescope.nvim',

	-- lsp and completion
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'jayp0521/mason-null-ls.nvim',
	'neovim/nvim-lspconfig',

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'saadparwaiz1/cmp_luasnip',

	-- utils
	'windwp/nvim-autopairs',
	'akinsho/toggleterm.nvim',
	{ 'uga-rosa/ccc.nvim', branch = '0.7.2' },
	'lukas-reineke/indent-blankline.nvim',
	'folke/which-key.nvim',
	'numToStr/Comment.nvim',
	'jghauser/mkdir.nvim',
	'ahmedkhalf/project.nvim',
	'mbbill/undotree',
	'lewis6991/gitsigns.nvim',

	-- treesitter
	'p00f/nvim-ts-rainbow',
	{ 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },

	-- colorschemes
	{ 'RRethy/nvim-base16', lazy = false },

	-- snippets
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',

	-- status bar
	'feline-nvim/feline.nvim',

	-- tabs
	'akinsho/bufferline.nvim',

	-- note taking
    'vimwiki/vimwiki',
    'lervag/vimtex',
    {'iamcco/markdown-preview.nvim', config = function() vim.fn["mkdp#util#install"]() end,},

	-- debugging
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'jayp0521/mason-nvim-dap.nvim',
})

vim.cmd 'colorscheme base16-catppuccin'
Opts = { noremap = true, silent = true }
Bind = vim.api.nvim_set_keymap

local req = {
	'cmp',
	'lsp',
	'feline',
	'toggleterm',
	'gitsigns',
	'treesitter',
	'other',
	'bufferline',
	'telescope',
}

for _, pkg in ipairs(req) do
	require ('user.config.' .. pkg)
end
