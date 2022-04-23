local stats_ok, null_ls = pcall(require, 'null-ls')
if not stats_ok then
	return
end

local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylua,
	},
})
