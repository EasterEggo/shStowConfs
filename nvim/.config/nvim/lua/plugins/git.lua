return {
	"lewis6991/gitsigns.nvim",
	{
	  "NeogitOrg/neogit",
	  dependencies = {
	    "nvim-lua/plenary.nvim",         -- required
	    "sindrets/diffview.nvim",        -- optional
	    "nvim-telescope/telescope.nvim", -- optional
	    "echasnovski/mini.pick",         -- optional
	  },
	  config = true
	},
	{
	"moyiz/git-dev.nvim",
	event = "VeryLazy",
	lazy = true,
 	cmd = {
		"GitDevClean",
		"GitDevCleanAll",
		"GitDevCloseBuffers",
		"GitDevOpen",
		"GitDevRecents",
		"GitDevToggleUI",
	},
	opts = {},
	},
	{
	'pwntester/octo.nvim',
	requires = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {},
	},

}
