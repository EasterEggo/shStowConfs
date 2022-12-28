local opts = {
	on_attach = require('user.config.lsp.handlers').on_attach,
	capabilities = require('user.config.lsp.handlers').capabilities,
}

local servers = {
	'sumneko_lua',
	'pyright',
	'bashls',
	'rust_analyzer',
	'clangd',
}

local settings = {
	ui = {
		border = 'none',
		icons = {
			package_installed = '◍',
			package_pending = '◍',
			package_uninstalled = '◍',
		},
	},
	log_level = vim.log.levels.INFO,
}

mason.setup(settings)
mlsp.setup({
	ensure_installed = servers,
	automatic_installation = true,
})
mlsp.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
	['sumneko_lua'] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		})
	end,
})
