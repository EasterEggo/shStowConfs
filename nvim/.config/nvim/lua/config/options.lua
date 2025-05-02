local options = {
    backup = false,
    completeopt = { 'menuone', 'noselect' },
    conceallevel = 0,
    autochdir = true,
    ignorecase = true,
    pumheight = 10,
    showmode = false,
    smartcase = true,
    smartindent = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 100,
    updatetime = 50,
    writebackup = false,
    cursorline = true,
    wrap = false,

    relativenumber = true,
    number = true,
    numberwidth = 4,

    signcolumn = 'yes',
    scrolloff = 8,
    sidescrolloff = 8,

    hlsearch = false,
    incsearch = true,

    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
    expandtab = true,

    undodir = os.getenv 'HOME' .. '/.config/nvim/undodir/',
    undofile = true,

    colorcolumn = '95',
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
    vim.opt[k] = v
end
