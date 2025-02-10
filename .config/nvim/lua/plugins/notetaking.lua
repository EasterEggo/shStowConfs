return {
  {
    "3rd/image.nvim",
    opts = {}
  },
  {"nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function ()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.image"] = {},
        ["core.latex.renderer"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/norg",
              },
              default_workspace = "notes",
          },
        },
      }
    })
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
  }
}
