return {
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({})
		end,
		keys = {
			{ "<leader>t", "<cmd>BufferLinePick<cr>", desc = "pick tabs" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
			highlight = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
