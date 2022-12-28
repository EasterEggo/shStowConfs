local zk = require 'zk'
zk.setup({ picker = 'telescope' })

Bind('n', '<leader>zz', ':ZkNotes <CR>', Opts)
Bind('n', '<leader>zn', ':ZkNew <CR>', Opts)
Bind('n', '<leader>zb', ':ZkBacklinks <CR>', Opts)
Bind('n', '<leader>zl', ':ZkLinks <CR>', Opts)
Bind('n', '<leader>zt', ':ZkTags <CR>', Opts)
Bind('n', '<leader>zp', ':MarkdownPreviewToggle <CR>', Opts)
