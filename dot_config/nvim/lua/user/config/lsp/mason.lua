local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
    return vim.notify("problem with mason.nvim")
end

local masonlsp_ok, mlsp = pcall(require, 'mason-lspconfig')
if not masonlsp_ok then
    return vim.notify("problem with mason-lspconfig.nvim")
end

local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
    return vim.notify("problem with lspconfig")
end

local opts = {
    on_attach = require('user.config.lsp.handlers').on_attach,
    capabilities = require('user.config.lsp.handlers').capabilities,
}

local servers = {
    'lua_ls',
    'pyright',
    'bashls',
    'rust_analyzer',
    'clangd',
}

local settings = {
    ui = {
        border = 'none',
        icons = {
            package_installed = '◍',
            package_pending = '◍',
            package_uninstalled = '◍',
        },
    },
    log_level = vim.log.levels.INFO,
}

mason.setup(settings)
mlsp.setup({
    ensure_installed = servers,
    automatic_installation = true,
})
mlsp.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
        })
    end,
    ['lua_ls'] = function()
        lspconfig.lua_ls.setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })
    end,
})
