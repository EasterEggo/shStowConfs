local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return vim.notify('problem with treesitter')
end

treesitter.setup({
	ensure_installed = 'all',
	ignore_install = { '' },
	highlight = {
		enable = true,
		disable = { '' },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { 'yaml' },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
})
