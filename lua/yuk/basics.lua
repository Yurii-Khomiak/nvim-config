local opts = vim.opt

opts.compatible = false
vim.cmd('syntax on')
vim.cmd('filetype plugin on')

opts.exrc = true -- Is this needed???
opts.encoding = 'utf-8'
opts.wrap = false
opts.tw = 0 -- remove auto line wrapping?
opts.errorbells = false
opts.hlsearch = false
opts.incsearch = true
opts.backspace = 'indent,eol,start'
opts.wildmode = 'longest,list,full' -- enable autocompletion

-- Splits
opts.splitbelow = true
opts.splitright = true

-- Line numbers and rulers
opts.number = true
opts.rnu = true
opts.colorcolumn = '80,100'
vim.cmd('highlight ColorColumn ctermbg=0 guibg=grey')

-- Indentation
opts.expandtab = true
opts.shiftwidth = 4
opts.tabstop = 4
opts.shiftwidth = 4

-- Folding
opts.foldmethod = 'indent'
opts.foldnestmax = 10
opts.foldenable = false
opts.foldlevel = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opts.updatetime = 50

-- Show preview on replace
opts.inccommand = "split"

-- Search
opts.smartcase = true
opts.ignorecase = true

-- Undo
opts.swapfile = false
opts.backup = false
opts.undofile = true

-- Show trailing whitespaces
vim.cmd([[:highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[:match ExtraWhitespace /\s\+$/]])

