let mapleader = " "

" Initialize plugin system
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

Plug 'ThePrimeagen/vim-be-good'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo' " todo managing
Plug 'mbbill/undotree'

" autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Appearance
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

" =============================================================================
" Search & replace (refactor)

nnoremap <leader>sp :Rg<space>
nnoremap <leader>sw :Rg <C-R>=expand("<cword>")<cr><cr>

nnoremap <leader>rp :CocSearch<space>
nnoremap <leader>rP :CocSearch<space>--no-ignore<space>
nnoremap <leader>rw :CocSearch <C-r>=expand("<cword>")<cr><cr>

