" Indentation
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab

" General snippets
inoremap <buffer> ;<space> <space>
inoremap <buffer> ;. this.
inoremap <buffer> ;( ({  })<esc>2hi
inoremap <buffer> ;) ({<cr>})<esc>O
inoremap <buffer> ;{ {<cr>}<esc>O
inoremap <buffer> ;} {  }<esc>hi
inoremap <buffer> ;cn const  = <++>;<esc>2bhi
inoremap <buffer> ;l let  = <++>;<esc>$F=hi
inoremap <buffer> ;c.e console.error();<left><left>
inoremap <buffer> ;c.l console.log();<left><left>
inoremap <buffer> ;of Object.freeze({<cr>})<esc>O
inoremap <buffer> ;re return ;<esc>i
inoremap <buffer> ;rq require('')<esc>hi
inoremap <buffer> ;n new (<++>)<esc>F(i

inoremap <buffer> ;i if () {<cr><++><cr>}<esc>=2k0f(a
inoremap <buffer> ;ei else if () {<cr><++><cr>}<esc>=2k0f(a
inoremap <buffer> ;el else {<cr>}<esc>=ko
inoremap <buffer> ;eb try {<cr>}<cr>catch (e) {<cr>}<esc>=3ko

" Function snippets
inoremap <buffer> ;fs <space>=> <++><esc>F=hi
inoremap <buffer> ;ff <space>=> {<cr><++><cr>}<esc>=2k$F=hi
inoremap <buffer> ;fas async  => <++><esc>F=hi
inoremap <buffer> ;faf async  => {<cr><++><cr>}<esc>=2k$F=hi

" Class snippets
inoremap <buffer> ;cl class  {<cr><++><cr>}<esc>=2kela
inoremap <buffer> ;ct constructor() {<cr><++><cr>}<esc>=2kf(a
inoremap <buffer> ;mu (<++>) {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;mg get () {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;ms set (<++>) {<cr><++><cr>}<esc>=2k0f(i
inoremap <buffer> ;ma async (<++>) {<cr><++><cr>}<esc>=2k$F(i

" JSDoc snippets
inoremap <buffer> ;** /**<cr> * <cr> */<esc>=2kjA
inoremap <buffer> ;@pa @param {
inoremap <buffer> ;@pr @property {
inoremap <buffer> ;@re @returns {
inoremap <buffer> ;@td /**<cr> * @typedef {<cr>*/<esc>=2kjA

" Save buffer and execute tape test
command! RunJSTest :w | !node<space>%<space><bar><space>tap-spec
nnoremap <buffer> <leader>te :RunJSTest<cr>

nnoremap <buffer> <leader>to $?^test<cr>3la.only<esc><C-o>
nnoremap <buffer> <leader>ts $?^test<cr>3la.skip<esc><C-o>
nnoremap <buffer> <leader>tn $?^test<cr>f.dt(<C-o>

" Tape snippets
inoremap <buffer> ;tc test('', assert => {<cr><cr>assert.end();<cr>});<esc>3k$F'i
inoremap <buffer> ;all assert.equal(, <++>, <++>);<esc>T(i
inoremap <buffer> ;alt assert.equal(, true, <++>);<esc>T(i
inoremap <buffer> ;alf assert.equal(, false, <++>);<esc>T(i
inoremap <buffer> ;ad assert.deepEqual(, <++>, <++>);<esc>T(i
inoremap <buffer> ;at assert.throws(, <++>, <++>);<esc>T(i
inoremap <buffer> ;as 'given<space><space>should<space><++>'<esc>2bhi

