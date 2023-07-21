" Binding for replace all
nnoremap S :%s//g<left><left>

" Center when circling through search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" Center in top half of the screen
nnoremap ze zz15<C-e>
nnoremap <C-^> <C-^>zz

" Config related
nnoremap <leader>cs :so ~/.config/nvim/init.lua<cr>:e<cr>
nnoremap <leader>ce :e ~/.config/nvim/init.lua<cr>

" Bindings for pasting
nnoremap <C-p> "+p

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

" Shortcutting split navigation, saving a keypress
map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

" Binding to use <++> as jump points in snippets
inoremap <space><space> <esc>/<++><cr>:noh<cr>"_c4l

