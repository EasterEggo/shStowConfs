local status_ok, lspc = pcall(require, 'lspconfig')
if not status_ok then
	return
end

lspc.sumneko_lua.setup {
	diagnostics = {
		globals = {'vim'},
	},
	telemetry = {
		enable = false,
	},
}
