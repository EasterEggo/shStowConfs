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
