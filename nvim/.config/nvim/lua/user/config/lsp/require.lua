mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
	vim.notify("problem with mason.nvim")
	return
end

masonlsp_ok, mlsp = pcall(require, 'mason-lspconfig')
if not masonlsp_ok then
	vim.notify("problem with mason-lspconfig.nvim")
	return
end

status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
	vim.notify("problem with lspconfig")
	return
end

stats_ok, null_ls = pcall(require, 'null-ls')
if not stats_ok then
	return
end

masonnull_ok, mnulls = pcall(require, 'mason-null-ls')
if not masonnull_ok then
	return
end

dap_ok, dap = pcall(require, 'dap')
if not masonnull_ok then
	return
end

