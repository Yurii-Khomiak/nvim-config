set nocompatible
syntax on " enable syntax highlighting
filetype plugin on

set exrc " ".nvimrc" or ".exrc"
set nowrap
set noerrorbells
set nohlsearch
set encoding=utf-8
set nu rnu " display relative line numbers
set tw=0 " remove auto line wrapping
set backspace=indent,eol,start
set incsearch
set wildmode=longest,list,full " enable autocompletion
set splitbelow splitright " More intuitive split direction than default

" Default indentation
set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" undo
set noswapfile
set nobackup
set undofile
if has("win32")
	set undodir="c:\\undo"
else
	set undodir="~/.cache/vim/undodir"
endif

" Rulers
set colorcolumn=80,100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" OS specific
if has("win32")
	set shell=cmd.exe
endif

augroup MyBasicAutocommands
	au!
	" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Provide support for JSON with comments
	autocmd FileType json syntax match Comment +\/\/.\+$+

augroup END

" Show trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

