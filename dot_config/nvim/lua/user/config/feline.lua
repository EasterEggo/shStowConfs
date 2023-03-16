local status_ok, feline = pcall(require, 'feline')
if not status_ok then
	return vim.notify('problem with feline')
end
local lsp = require 'feline.providers.lsp'

local lspicons = {
	errs = ' ',
	warns = ' ',
	infos = ' ',
	hints = ' ',
}

local gruvbox_colors = {
	bg = '#1d2021',
	fg = '#D9E0EE',
	yellow = '#d8a657',
	cyan = '#96CDFB',
	gray = '#6E6C7E',
	green = '#a9b665',
	orange = '#e78a4e',
	magenta = '#d3869b',
	blue = '#7daea3',
	red = '#ea6962',
}
local catppuccin_colors = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	orange = "#FAB387",
	yellow = "#F9E2AF",
	green = "#A6E3A1",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",

	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",

	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",
}

local vi_mode_utils = require 'feline.providers.vi_mode'

local function vimode_hl()
	return {
		name = vi_mode_utils.get_mode_highlight_name(),
		fg = vi_mode_utils.get_mode_color(),
	}
end

local function lsp_diagnostics_info()
	return {
		errs = lsp.get_diagnostics_count 'Error',
		warns = lsp.get_diagnostics_count 'Warn',
		infos = lsp.get_diagnostics_count 'Info',
		hints = lsp.get_diagnostics_count 'Hint',
	}
end

local function diag_enable(f, s)
	return function()
		local diag = f()[s]
		return diag and diag ~= 0
	end
end

local function diag_of(f, s)
	local icon = lspicons[s]
	return function()
		local diag = f()[s]
		return icon .. diag
	end
end

local function file_osinfo()
	local os = vim.bo.fileformat:upper()
	local icon
	if os == 'UNIX' then
		icon = ' '
	elseif os == 'MAC' then
		icon = ' '
	else
		icon = ' '
	end
	return icon .. os
end

local comps = {
	position = {
		provider = 'position',
		left_sep = ' ',
		hl = {
			fg = catppuccin_colors.surface2,
			style = 'bold',
		},
	},
	diagnos = {
		err = {
			enabled = diag_enable(lsp_diagnostics_info, 'errs'),
			provider = diag_of(lsp_diagnostics_info, 'errs'),
			left_sep = ' ',
			hl = {
				fg = catppuccin_colors.red,
			},
		},
		warn = {
			enabled = diag_enable(lsp_diagnostics_info, 'warns'),
			provider = diag_of(lsp_diagnostics_info, 'warns'),
			left_sep = ' ',
			hl = {
				fg = catppuccin_colors.orange,
			},
		},
		info = {
			enabled = diag_enable(lsp_diagnostics_info, 'infos'),
			provider = diag_of(lsp_diagnostics_info, 'infos'),
			left_sep = ' ',
			hl = {
				fg = catppuccin_colors.blue,
			},
		},
		hint = {
			enabled = diag_enable(lsp_diagnostics_info, 'hints'),
			provider = diag_of(lsp_diagnostics_info, 'hints'),
			left_sep = ' ',
			hl = {
				fg = catppuccin_colors.sapphire,
			},
		},
	},
	vi_mode = {
		left = {
			provider = '▊',
			hl = vimode_hl,
			right_sep = ' ',
		},
		right = {
			provider = '▊',
			hl = vimode_hl,
			left_sep = ' ',
		},
	},
	file = {
		info = {
			provider = {
				name = 'file_info',
				opts = {
					type = 'base-only',
					file_readonly_icon = '  ',
					file_modified_icon = '',
				},
			},
			hl = {
				fg = catppuccin_colors.blue,
				style = 'bold',
			},
		},
	},
	os = {
		provider = file_osinfo,
		left_sep = ' ',
		hl = {
			fg = catppuccin_colors.maroon,
			style = 'bold',
		},
	},
	git = {
		branch = {
			provider = 'git_branch',
			icon = '  ',
			left_sep = ' ',
			hl = {
				fg = catppuccin_colors.maroon,
				style = 'bold',
			},
		},
		add = {
			provider = 'git_diff_added',
			icon = '  ',
			hl = {
				fg = catppuccin_colors.green,
			},
		},
		change = {
			provider = 'git_diff_changed',
			icon = '  ',
			hl = {
				fg = catppuccin_colors.orange,
			},
		},
		remove = {
			provider = 'git_diff_removed',
			icon = '  ',
			right_sep = '',
			hl = {
				fg = catppuccin_colors.red,
			},
		},
	},
	lsp = {
		name = {
			provider = 'lsp_client_names',
			left_sep = '',
			icon = ' ',
			hl = {
				fg = catppuccin_colors.yellow,
				style = 'bold',
			},
		},
	},
	line_percentage = {
		provider = 'line_percentage',
		right_sep = '',
		left_sep = ' ',
		hl = {
			fg = catppuccin_colors.surface2,
			style = 'bold',
		},
	},
}

local components = {
	active = {},
	inactive = {},
}
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

components.active[1] = {
	comps.vi_mode.left,
	comps.file.info,
	comps.git.branch,
	comps.git.add,
	comps.git.change,
	comps.git.remove,
}

components.active[2] = {
	comps.lsp.name,
	comps.diagnos.err,
	comps.diagnos.hint,
	comps.diagnos.info,
	comps.diagnos.warn,
}

components.active[3] = {
	comps.os,
	comps.position,
	comps.line_percentage,
	comps.vi_mode.right,
}

feline.setup({
	theme = catppuccin_colors,
	default_bg = catppuccin_colors.crust,
	default_fg = catppuccin_colors.text,
	components = components,
})
