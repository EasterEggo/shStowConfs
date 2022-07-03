_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}

local status_ok, nTree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end
local status_ok1, colorizer = pcall(require, 'colorizer')
if not status_ok then
	return
end
local status_ok2, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
	return
end
local status_ok3, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
	return
end
local status_ok4, whichKey = pcall(require, 'which-key')
if not status_ok then
	return
end
local status_ok5, alpha = pcall(require, 'alpha')
if not status_ok then
	return
end
local status_ok6, comment = pcall(require, 'Comment')
if not status_ok then
	return
end
local status_ok7, telescope = pcall(require, 'telescope')
if not status_ok then
	return
end

local status_ok8, impatient = pcall(require, 'impatient')
if not status_ok then
	return
end

nTree.setup()
colorizer.setup()
indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
})
autopairs.setup()
whichKey.setup()
alpha.setup(require('alpha.themes.startify').config)
comment.setup()
telescope.load_extension 'media_files'
