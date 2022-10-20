local opts = {
	on_attach = require('user.config.lsp.handlers').on_attach,
	capabilities = require('user.config.lsp.handlers').capabilities,
}

local servers = {
	'sumneko_lua',
	'pyright',
	'bashls',
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
	max_concurrent_installers = 4,
}

mason.setup(settings)
mlsp.setup({
	automatic_installation = true,
})
mlsp.setup_handlers({
        function (server_name)
            require("lspconfig")[server_name].setup {opts}
        end,
	['sumneko_lua'] = function()
		lspconfig.sumneko_lua.setup({
			diagnostics = {
				globals = { 'vim' },
			},
		})
	end,
})

for _, server in pairs(servers) do
	local require_ok, conf_opts = pcall(require, 'user.lsp.settings')
	if require_ok then
		opts = vim.tbl_deep_extend('force', conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
