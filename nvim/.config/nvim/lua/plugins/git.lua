return {
	"lewis6991/gitsigns.nvim",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"echasnovski/mini.pick",
		},
		config = true,
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
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
}
