local opts = {noremap = true, silent = true}
local bind = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

bind("", "<Space>", "<Nop>", opts)
bind("n", "<leader>.", ":NvimTreeToggle <CR>", opts)

-- Better window navigation
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)
bind("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
bind("n", "<C-Up>", ":resize -2<CR>", opts)
bind("n", "<C-Down>", ":resize +2<CR>", opts)
bind("n", "<C-Left>", ":vertical resize -2<CR>", opts)
bind("n", "<C-Right>", ":vertical resize +2<CR>", opts)
