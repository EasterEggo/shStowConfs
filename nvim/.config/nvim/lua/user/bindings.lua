local opts = { noremap = true, silent = true }
local bind = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

bind('', '<Space>', '<Nop>', opts)
bind('n', '<leader>.', ':NvimTreeToggle <CR>', opts)
bind('n', '<leader>,', ':lua vim.lsp.buf.formatting_sync() <CR>', opts)
bind('n', '<leader>g', ':Git <CR>', opts)

-- Better window navigation
bind('n', '<C-h>', '<C-w>h', opts)
bind('n', '<C-j>', '<C-w>j', opts)
bind('n', '<C-k>', '<C-w>k', opts)
bind('n', '<C-l>', '<C-w>l', opts)

-- buffer cmds
bind('n', '<leader>bb', ':BufferLinePickClose <CR>', opts)
bind('n', '<leader>be', ':BufferLinePick <CR>', opts)
