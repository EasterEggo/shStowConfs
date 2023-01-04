local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
	return
end

M.setup = function()
	local signs = {
		{ name = 'DiagnosticSignError', text = '' },
		{ name = 'DiagnosticSignWarn', text = '' },
		{ name = 'DiagnosticSignHint', text = '' },
		{ name = 'DiagnosticSignInfo', text = '' },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local vim_diag = '<cmd>lua vim.diagnostic'
	local lsp_buf = '<cmd>lua vim.lsp.buf'
	local set_keymap = vim.api.nvim_buf_set_keymap

	local opts = { noremap = true, silent = true }

	set_keymap(bufnr, 'n', 'gD', lsp_buf .. 'declaration()<CR>', opts)
	set_keymap(bufnr, 'n', 'gd', lsp_buf .. '.definition()<CR>', opts)
	set_keymap(bufnr, 'n', 'K', lsp_buf .. '.hover()<CR>', opts)
	set_keymap(bufnr, 'n', 'gi', lsp_buf .. '.implementation()<CR>', opts)
	set_keymap(bufnr, 'n', '<C-k>', lsp_buf .. '.signature_help()<CR>', opts)
	set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	set_keymap(bufnr, 'n', 'gr', lsp_buf .. '.references()<CR>', opts)
	set_keymap(bufnr, 'n', '<leader>ca', lsp_buf .. '.code_action()<CR>', opts)
	set_keymap(bufnr, 'n', '<leader>f', vim_diag .. '.open_float()<CR>', opts)
	set_keymap(bufnr, 'n', '[d', vim_diag .. '.goto_prev({ border = "rounded" })<CR>', opts)
	set_keymap(bufnr, 'n', 'gl', vim_diag .. '.open_float({ border = "rounded" })<CR>', opts)
	set_keymap(bufnr, 'n', ']d', vim_diag .. '.goto_next({ border = "rounded" })<CR>', opts)
	set_keymap(bufnr, 'n', '<leader>q', vim_diag .. '.setloclist()<CR>', opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	local function ignore_formatting(lsp_client_name)
		if client.name == lsp_client_name then
			client.server_capabilities.document_formatting = false
		end
	end

	ignore_formatting 'sumneko_lua'

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
