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

lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
	vim.notify("problem with lspconfig")
	return
end

null_ok, null_ls = pcall(require, 'null-ls')
if not null_ok then
	return
end

masonnull_ok, mnulls = pcall(require, 'mason-null-ls')
if not masonnull_ok then
	return
end

dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
	return
end

dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
	return
end

masondap_ok, mdap = pcall(require, 'mason-nvim-dap')
if not masondap_ok then
	return
end

nav_ok, navic = pcall(require, 'nvim-navic')
if not nav_ok then
	return
end
