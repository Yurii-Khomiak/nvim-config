local config_keybindings = function()
    local km = vim.keymap

    km.set("n", "gd", function() vim.lsp.buf.definition() end, {})
    km.set("n", "K", function() vim.lsp.buf.hover() end, {})
    km.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {})
    km.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {})
    km.set("n", "[d", function() vim.diagnostic.goto_next() end, {})
    km.set("n", "]d", function() vim.diagnostic.goto_prev() end, {})
    km.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {})
    km.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {})
    km.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {})
    km.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {})
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

local config_python = function(lspconfig)
    -- LSP repo: https://github.com/python-lsp/python-lsp-server
    -- pip install "python-lsp-server[all]"
    -- repo: https://github.com/python-lsp/pylsp-mypy
    -- pip install pylsp-mypy

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig.pylsp.setup {
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pylsp_mypy = {
                        enabled = true,
                        live_mode = true,
                        overrides = {
                            true,
                            "--check-untyped-defs",
                        },
                    },
                    pycodestyle = {
                        enabled = true,
                        ignore = { "E501", "E261", "W503" }
                    },
                }
            }
        }
    }
end

local config_golang = function(lspconfig)
    -- LSP repo: https://github.com/golang/tools/tree/master/gopls
    -- go install golang.org/x/tools/gopls@latest

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    lspconfig.gopls.setup { capabilities = capabilities }
end

local add_format_on_save = function(client, buf)
    local filetype = vim.filetype.match({ buf = buf })
    if (filetype == 'perl') then
        return
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = buf,
        callback = function()
            vim.lsp.buf.format({ bufnr = buf, id = client.id })
        end
    })
end

local config = function()
    local lspconfig = require('lspconfig')

    config_keybindings()

    config_lua(lspconfig)
    config_perl(lspconfig)
    config_python(lspconfig)
    config_golang(lspconfig)

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then
                return
            end

            if client.supports_method('textDocument/formatting') then
                add_format_on_save(client, args.buf)
            end
        end,
    })
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
        config = config,
    }
}
