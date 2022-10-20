local opts = { noremap = true, silent = true }
local bind = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

bind('', '<Space>', '<Nop>', opts)
bind('n', '<leader>,', ':lua vim.lsp.buf.format() <CR>', opts)
bind('n', '<leader>g', ':TermExec cmd=lazygit <CR>', opts)

-- Better window navigation
bind('n', '<C-h>', '<C-w>h', opts)
bind('n', '<C-j>', '<C-w>j', opts)
bind('n', '<C-k>', '<C-w>k', opts)
bind('n', '<C-l>', '<C-w>l', opts)

-- buffer cmds
bind('n', '<leader>bb', ':BufferLinePickClose <CR>', opts)
bind('n', '<leader>be', ':BufferLinePick <CR>', opts)

-- telescope
bind('n', '<leader>.', ':Telescope file_browser <CR>', opts)
bind('n', '<leader>tt', ':Telescope <CR>', opts)
bind('n', '<leader>tc', ':Telescope colorscheme <CR>', opts)
bind('n', '<leader>tg', ':Telescope live_grep <CR>', opts)
bind('n', '<leader>th', ':Telescope help_tags <CR>', opts)
bind('n', '<leader>tm', ':Telescope man_pages <CR>', opts)

-- zk
bind('n', '<leader>zz', ':ZkNotes <CR>', opts)
bind('n', '<leader>zn', ':ZkNew <CR>', opts)
bind('n', '<leader>zb', ':ZkBacklinks <CR>', opts)
bind('n', '<leader>zl', ':ZkLinks <CR>', opts)
bind('n', '<leader>zt', ':ZkTags <CR>', opts)
bind('n', '<leader>zp', ':MarkdownPreviewToggle <CR>', opts)

-- dap
bind('n', '<leader>db', ':DapToggleBreakpoint <CR>', opts)
bind('n', '<leader>dd', ':DapContinue <CR>', opts)

-- ccc
bind('n', '<leader>p', ':CccPick <CR>', opts)
