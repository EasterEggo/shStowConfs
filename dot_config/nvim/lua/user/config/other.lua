local project = require 'project_nvim'
local ccc = require 'ccc'
local indent_blankline = require 'ibl'
local autopairs = require 'nvim-autopairs'
local whichKey = require 'which-key'
local alpha = require 'alpha'
local comment = require 'Comment'

project.setup({ show_hidden = true })
indent_blankline.setup()
autopairs.setup()
whichKey.setup()
alpha.setup(require('alpha.themes.startify').config)
comment.setup()

ccc.setup({ highlighter = { auto_enable = true } })
