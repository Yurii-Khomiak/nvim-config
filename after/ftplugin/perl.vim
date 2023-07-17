setlocal shiftwidth=4 softtabstop=4 expandtab

inoremap <buffer> ;<space> <space>
inoremap <buffer> ;~ use<space>strict;<cr>use<space>warnings;<cr><cr>

" variables
inoremap <buffer> ;vs my $;<esc>i
inoremap <buffer> ;vS my $ = <++>;<esc>F$a
inoremap <buffer> ;va my @;<esc>i
inoremap <buffer> ;vA my @ = (<++>);<esc>F@a
inoremap <buffer> ;vh my %;<esc>i
inoremap <buffer> ;vH my % = (<++>);<esc>F%a

" ifs
inoremap <buffer> ;if if () {<cr><++><cr>}<esc>2k$F)i
inoremap <buffer> ;is elsif () {<cr><++><cr>}<esc>2k$F)i
inoremap <buffer> ;ie else {<cr>}<esc>O

