Bind('', '<Space>', '<Nop>', Opts)
Bind('n', '<leader>,', ':lua vim.lsp.buf.format() <CR>', Opts)
Bind('n', '<leader>g', ':TermExec cmd=lazygit <CR>', Opts)

-- Better window navigation
Bind('n', '<C-h>', '<C-w>h', Opts)
Bind('n', '<C-j>', '<C-w>j', Opts)
Bind('n', '<C-k>', '<C-w>k', Opts)
Bind('n', '<C-l>', '<C-w>l', Opts)

-- ccc
Bind('n', '<leader>p', ':CccPick <CR>', Opts)

-- hop
Bind('n', '<leader>hh', ':HopWord <CR>', Opts)
Bind('n', '<leader>hl', ':HopLine <CR>', Opts)
