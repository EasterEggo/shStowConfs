local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

mnulls.setup({
	ensure_installed = {'stylua'},
	automatic_installation = true,
})
mnulls.setup_handlers {
	stylua = function ()
		null_ls.register(formatting.stylua)
	end,
	cpplint = function ()
		null_ls.register(diagnostics.cpplint)
	end,
}
null_ls.setup()
