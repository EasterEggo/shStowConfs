return {
	{
		"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
    keys = {
      {"<leader>o", "<cmd>Oil<cr>", desc = "open parent directory"}
    }
	},
}
