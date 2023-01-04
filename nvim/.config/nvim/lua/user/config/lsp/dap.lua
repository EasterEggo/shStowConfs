local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
	return vim.notify('problem with dap')
end

local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
	return vim.notify('problem with dapui')
end

local masondap_ok, mdap = pcall(require, 'mason-nvim-dap')
if not masondap_ok then
	return vim.notify('problem with mason-dap')
end

mdap.setup {
	ensure_installed = {'codelldb'},
	automatic_setup = true,
}
mdap.setup_handlers {
	function(source_name)
		require('mason-nvim-dap.automatic_setup')(source_name)
    	end,

}
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

Bind('n', '<leader>db', ':DapToggleBreakpoint <CR>', Opts)
Bind('n', '<leader>dd', ':DapContinue <CR>', Opts)
Bind('n', 'dl', ':lua dapui.eval() <CR>', Opts)
