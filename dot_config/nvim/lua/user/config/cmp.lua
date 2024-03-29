local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
	return vim.notify('problem with cmp')
end
local ls_status_ok, luasnip = pcall(require, 'luasnip')
if not ls_status_ok then
	return vim.notify('problem with luasnip')
end

require('luasnip/loaders/from_vscode').lazy_load()

local kind_icons = {
	Text = '',
	Method = 'm',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				luasnip = '[Snippet]',
				buffer = '[Buffer]',
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
	}, {
		{ name = 'buffer' },
	}),
})
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
