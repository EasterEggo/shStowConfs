local options = {
	backup = false,
	completeopt = { 'menuone', 'noselect' },
	conceallevel = 0,
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 100,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	cursorline = true,
	number = true,
	numberwidth = 4,
	signcolumn = 'yes',
	scrolloff = 8,
	sidescrolloff = 8,
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
	vim.opt[k] = v
end
