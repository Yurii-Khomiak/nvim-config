" =============================================================================
" <leader> key

let mapleader = " "

" =============================================================================
" Plugins

" Initialize plugin system
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ThePrimeagen/vim-be-good'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim' " distraction-free mode
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo' " todo managing
Plug 'mbbill/undotree'

" autocmd FileType apache setlocal commentstring=#\ %s
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Appearance
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

" =============================================================================
" Sane defaults

set nocompatible
syntax on " enable syntax highlighting
filetype plugin on
set nowrap
set noerrorbells
set nohlsearch
set noswapfile
set nobackup
set undodir="~/.cache/vim/undodir"
set undofile
set encoding=utf-8
set nu rnu " display relative line numbers
set tw=0 " remove auto line wrapping
set backspace=indent,eol,start
set incsearch
set wildmode=longest,list,full " enable autocompletion
set mouse="" " disable mouse (very important)

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" More intuitive split direction than default
set splitbelow splitright

" Rulers
set colorcolumn=80,100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" =============================================================================
" OS specific settings

if has("win32")
	set shell=cmd.exe
endif

" =============================================================================
" Colorscheme

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

" =============================================================================
" Builtin explorer

let g:netrw_banner = 0 " remove help info on top
let g:netrw_winsize = 40
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'nu rnu'

" Open netrw on the side
nnoremap <leader>= :lefta :winc v <bar> :Ex <bar> :vertical resize 40 <bar><cr>

" =============================================================================
" Indentation settings

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

" =============================================================================
" TODO settings

let g:bujo#todo_file_path = $HOME . "/.cache/vim/bujo"
let g:bujo#window_width = 60

nnoremap <leader>tT :lefta Todo<cr>
nnoremap <leader>tt :lefta Todo g<cr>
nmap <leader>ta o<esc><plug>BujoAddnormal
nmap <leader>tu <plug>BujoChecknormal <bar> :noh<cr>

" =============================================================================
" Fuzzy finder settings

let g:fzf_layout = {
	\'up':'~90%',
	\'window': {
		\'width': 0.6,
		\'height': 0.6,
		\'yoffset': 0.2,
		\'xoffset': 0.5,
		\'border': 'sharp'
	\}
\}
let g:fzf_preview_window='' " Fix weird windows input behaviour

let $FZF_DEFAULT_OPTS = '--height 40% --layout=reverse --border'

nnoremap <leader>ob :Buffers<cr>
nnoremap <leader>of :Files<cr>
nnoremap <leader>og :GFiles<cr>

" =============================================================================
" Polyglot

let g:javascript_plugin_jsdoc = 1

" =============================================================================
" Undotree

nmap <leader>U :UndotreeToggle<cr>

let g:undotree_ShortIndicators = 1
let g:undotree_RelativeTimestamp = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffAutoOpen = 0
let g:undotree_SplitWidth = 40

" =============================================================================
" Coc related

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

nmap <leader>a <Plug>(coc-codeaction-selected)
xmap <leader>a <Plug>(coc-codeaction-selected)

" Select in and around function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Select in and around class
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" =============================================================================
" Search & replace (refactor)

nnoremap <leader>sp :Rg<space>
nnoremap <leader>sw :Rg <C-R>=expand("<cword>")<cr><cr>

nnoremap <leader>rp :CocSearch<space>
nnoremap <leader>rP :CocSearch<space>--no-ignore<space>
nnoremap <leader>rw :CocSearch <C-r>=expand("<cword>")<cr><cr>

" =============================================================================
" General bindings

" Save buffer
nnoremap <C-s> :w<cr>

" Config related
nnoremap <leader>cs :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>ce :e ~/.config/nvim/init.vim<cr>

" Bindings for pasting
cnoremap <C-'> <C-r>"
inoremap <C-'> <C-r>"
inoremap <C-=> <C-r>+
nnoremap <C-=> "+p

" Binding for replace all
nnoremap S :%s//g<left><left>

" Center when circling through search results
nnoremap n nzz
nnoremap N Nzz

" Center in top half of the screen
nnoremap ze zz15<C-e>

" Slower scroll bindings
nnoremap <C-,> 5<C-y>
nnoremap <C-.> 5<C-e>

" Shortcutting split navigation, saving a keypress
map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

" Goyo 'zen' mode binding (centers editor)
nnoremap <leader>z :Goyo<cr>

" Provide support for JSON with comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" Show trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Binding to use <++> as jump points in snippets
inoremap <space><space> <esc>/<++><cr>:noh<cr>"_c4l

" Disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Bindings for arrow keys
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-h> <left>
cnoremap <C-l> <right>

