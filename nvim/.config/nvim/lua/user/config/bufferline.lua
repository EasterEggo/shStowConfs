require('bufferline').setup({
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

Bind('n', '<leader>bb', ':BufferLinePickClose <CR>', Opts)
Bind('n', '<leader>be', ':BufferLinePick <CR>', Opts)
