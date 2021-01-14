let g:bujo#todo_file_path = $HOME . "/.cache/vim/bujo"
let g:bujo#window_width = 60

nnoremap <leader>tT :lefta Todo<cr>
nnoremap <leader>tt :lefta Todo g<cr>
nmap <leader>ta o<esc><plug>BujoAddnormal
nmap <leader>tu <plug>BujoChecknormal <bar> :noh<cr>

