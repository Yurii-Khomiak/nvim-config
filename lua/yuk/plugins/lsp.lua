local config_keybindings = function()
    local opts = {}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local config_lua = function(lspconfig)
    -- LSP repo: https://github.com/luals/lua-language-server

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig.lua_ls.setup { capabilities = capabilities }
end

local config_perl = function(lspconfig)
    -- LSP repo: https://github.com/FractalBoy/perl-language-server

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig.perlpls.setup {
        capabilities = capabilities,
        settings = {
            perl = {
                perlcritic = {
                    enabled = false
                },
                syntax = {
                    enabled = true
                },
            },
        },
    }
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "saghen/blink.cmp" },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require('lspconfig')

            config_keybindings()

            config_lua(lspconfig)
            config_perl(lspconfig)
        end
    }
}
