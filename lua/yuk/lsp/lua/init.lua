local custom_nvim_lspconfig_attach = function(...) end

require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = custom_nvim_lspconfig_attach,

    globals = {
    }
  })

