local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return vim.notify("problem with bufferline.lua")
end

bufferline.setup({
	options = {
		mode = 'buffers',
		offsets = { {
			filetype = 'NvimTree',
			text = '',
			text_align = 'left',
		} },
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_buffer_icons = true,
		always_show_bufferline = true,
		separator_style = 'padded_slant',
		numbers = 'none',
	},
})

Bind('n', '<leader>bb', ':BufferLinePick <CR>', Opts)
Bind('n', '<leader>bd', ':BufferLinePickClose <CR>', Opts)
