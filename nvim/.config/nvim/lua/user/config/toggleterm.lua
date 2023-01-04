local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return vim.notify('problem with toggleterm')
end

toggleterm.setup({
	size = 30,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2, --values: 1,2,3
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	direction = 'float',
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = 'curved',
		winblend = 0,
	},
})
