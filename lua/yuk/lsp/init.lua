-- require('yuk.lsp.lua')
require('yuk.lsp.ts')

vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.api.nvim_command(
  "let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']")

