setlocal shiftwidth=4 softtabstop=4 expandtab

inoremap <buffer> ;<space> <space>

" variables
inoremap <buffer> ;vs my $ = <++>;<esc>F$a
inoremap <buffer> ;va my @ = (<++>);<esc>F@a
inoremap <buffer> ;vh my % = (<++>);<esc>F%a

" ifs
inoremap <buffer> ;if if () {<cr><++><cr>}<esc>2k$F)i
inoremap <buffer> ;is elsif () {<cr><++><cr>}<esc>2k$F)i
inoremap <buffer> ;ie else {<cr>}<esc>O

