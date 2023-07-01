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
Plug 'tpope/vim-fugitive'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" Appearance
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

call plug#end()

if has('nvim')
	lua require('yuk')
endif

let g:coc_disable_startup_warning = 1

" =============================================================================
" Search & replace

if !has('nvim')
	nnoremap <leader>fW :Rg<space>
	nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<cr><cr>

endif

nnoremap <leader>rp :CocSearch<space>
nnoremap <leader>rP :CocSearch<space>--no-ignore<space>
nnoremap <leader>rw :CocSearch <C-r>=expand("<cword>")<cr><cr>

