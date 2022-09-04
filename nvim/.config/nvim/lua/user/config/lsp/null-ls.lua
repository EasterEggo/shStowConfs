local stats_ok, null_ls = pcall(require, 'null-ls')
if not stats_ok then
	return
end

local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.black,
		formatting.uncrustify,
	},
})
