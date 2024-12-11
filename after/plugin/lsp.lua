-- NVIM API completion
local neodev = vim.F.npcall(require, "neodev")
if neodev then
    neodev.setup {
        override = function(_, library)
            library.enabled = true
            library.plugins = true
        end,
        lspconfig = true,
        pathStrict = true,
    }
end

local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
    -- 'tsserver',
    'gopls'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    })
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

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
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-------------------------------------------------------------------------------
-- Go
-------------------------------------------------------------------------------

local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

local go_group_id = vim.api.nvim_create_augroup("GolangLspconfig", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = go_group_id,
    callback = function()
        vim.lsp.buf.format({async = false})
    end
})

