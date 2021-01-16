-- require('yuk.lsp.lua')
require('yuk.lsp.ts')

local function execute_vim_commands(commands)
  for _, command in ipairs(commands) do
    vim.api.nvim_command(command)
  end
end

execute_vim_commands({
    [1] = 'set completeopt=menuone,noinsert,noselect',
    [2] = "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']",

    [3] = 'nnoremap <leader>gd :lua vim.lsp.buf.definition()<cr>',
    [4] = 'nnoremap <leader>gi :lua vim.lsp.buf.implementation()<cr>',

    -- change this mb
    [5] = 'nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>',

    -- nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
    -- nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
    -- nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<cr>
    -- nnoremap <leader>vrr :lua vim.lsp.buf.references()<cr>
    -- nnoremap <leader>vh :lua vim.lsp.buf.hover()<cr>
    -- nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>
    -- nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<cr>
  })

