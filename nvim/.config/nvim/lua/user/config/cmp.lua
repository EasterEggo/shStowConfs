local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup({
	snippet = {
		expand = function(args)
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	end,
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
    		{ name = 'vsnip' },
  		},{
    		{ name = 'buffer' },
		})
	})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' },
  		}, {
    		{ name = 'buffer' },
  		})
})
cmp.setup.cmdline('/', {
  	mapping = cmp.mapping.preset.cmdline(),
  	sources = {
    		{ name = 'buffer' }
  	}
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
  	sources = cmp.config.sources({
    		{ name = 'path' }
  		}, {
    		{ name = 'cmdline' }
  	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
	capabilities = capabilities
}
