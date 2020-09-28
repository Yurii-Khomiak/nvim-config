" Indentation
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab

" Snippets
inoremap <buffer> ;<space> <space>
inoremap <buffer> ;t this.
inoremap <buffer> ;a; <esc>A;<esc>
inoremap <buffer> ;af async  => {<cr><++><cr>};<esc>:s/;;/;/<cr>2k$F>2h=2j$F>2hi
inoremap <buffer> ;am async (<++>) {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;c.e console.error();<left><left>
inoremap <buffer> ;c.l console.log();<left><left>
inoremap <buffer> ;cl class  {<cr><++><cr>}<esc>=2kela
inoremap <buffer> ;cn const  = <++>;<esc>2bhi
inoremap <buffer> ;ct constructor() {<cr><++><cr>}<esc>=2kf(a
inoremap <buffer> ;ei else if () {<cr><++><cr>}<esc>=2k0f(a
inoremap <buffer> ;el else {<cr>}<esc>=ko
inoremap <buffer> ;f <space>=> {<cr><++><cr>};<esc>:s/;;/;/<cr>2k$F>2h=2j$F>2hi
inoremap <buffer> ;gm get () {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;i if () {<cr><++><cr>}<esc>=2k0f(a
inoremap <buffer> ;l let  = <++>;<esc>0whi
inoremap <buffer> ;m (<++>) {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;of Object.freeze({<cr>});<esc>:s/;;/;/<cr>O
inoremap <buffer> ;re return ;<esc>i
inoremap <buffer> ;rq require('')<esc>hi
inoremap <buffer> ;sm set (<++>) {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;eb try {<cr>}<cr>catch (e) {<cr>}<esc>=3ko

" JSDoc snippets
inoremap <buffer> ;** /**<cr> * <cr> */<esc>=2kjA
inoremap <buffer> ;@pa @param {
inoremap <buffer> ;@pr @property {
inoremap <buffer> ;@re @returns {
inoremap <buffer> ;@td /**<cr> * @typedef {<cr>*/<esc>=2kjA

