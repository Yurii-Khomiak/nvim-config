local on_attach_listener = function(...)
  require('completion').on_attach(...)
end

require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = on_attach_listener 

    globals = {
    }
  })

