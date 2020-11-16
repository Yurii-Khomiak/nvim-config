" Indentation
autocmd FileType haskell setlocal shiftwidth=4 softtabstop=4 expandtab

" General snippets
inoremap <buffer> ;<space> <space>
inoremap <buffer> ;g <esc>o<bar><space>
inoremap <buffer> ;o otherwise =<space>
inoremap <buffer> ;im import<space>
inoremap <buffer> ;ifs if  then <++> else <++><esc>4bhi
inoremap <buffer> ;ifl if <cr>then <++><cr>else <++><esc>=2kA
inoremap <buffer> ;lc [  <bar> <++> ]<esc>F[la
inoremap <buffer> ;fs <esc>"zyiWO<C-r>z ::<space>

