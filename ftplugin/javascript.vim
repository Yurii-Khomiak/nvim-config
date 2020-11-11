" Indentation
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab

" File movements
nnoremap <buffer> <leader>mp :e package.json<cr>

" =============================================================================
" Refactorings

" extract variable
vnoremap <buffer> <leader>evr <esc>:call LoadInputIntoRegister("Variable name: ")<cr>
			\gv"yc<C-r>p<esc>Oconst <C-r>p = <C-r>y;<esc>==
vnoremap <buffer> <leader>evR <esc>:call LoadInputIntoRegister("Variable name: ")<cr>
			\gv"yc<C-r>p<esc>
nnoremap <buffer> <leader>evp Oconst <C-r>p = <C-r>y;<esc>==
nnoremap <buffer> <leader>evP iconst <C-r>p = <C-r>y;<esc>==

" extract variable from if's condition
nnoremap <buffer> <leader>ei :call LoadInputIntoRegister("Variable name: ")<cr>
			\0f("ydi("pPOconst <C-r>p<esc>A = <C-r>y;<esc>0w

" extract function
vnoremap <buffer> <leader>efr <esc>:call LoadInputIntoRegister("Function name: ")<cr>
			\gv"yc<C-r>p();<esc>
nnoremap <buffer> <leader>efp iconst <C-r>p = () => {<cr>};<esc>=1k"yp=i{

function! LoadInputIntoRegister(prompt)
	call inputsave()
	let result = input(a:prompt)
	call inputrestore()
	let @p = result
endfunction

" =============================================================================
" Snippets

" General snippets
inoremap <buffer> ;<space> <space>
inoremap <buffer> ;. this.
inoremap <buffer> ;{ {<cr>}<esc>O
inoremap <buffer> ;} {  }<esc>hi
inoremap <buffer> ;cn const  = <++>;<esc>2bhi
inoremap <buffer> ;c.e console.error();<left><left>
inoremap <buffer> ;c.l console.log();<left><left>
inoremap <buffer> ;of Object.freeze({<cr>})<esc>O
inoremap <buffer> ;re return ;<esc>i
inoremap <buffer> ;rq require('')<esc>hi
inoremap <buffer> ;n new (<++>)<esc>F(i
inoremap <buffer> ;ch <esc>$i<cr>

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

" List snippets
inoremap <buffer> ;la .map( => <++>)<esc>F(a
inoremap <buffer> ;lr .reduce((acc, ) => <++>, <++>)<esc>F)i
inoremap <buffer> ;lf .filter( => <++>)<esc>F(a

" JSDoc snippets
inoremap <buffer> ;** /**<cr> * <cr> */<esc>=2kjA
inoremap <buffer> ;@pa @param {
inoremap <buffer> ;@pr @property {
inoremap <buffer> ;@re @returns {
inoremap <buffer> ;@td /**<cr> * @typedef {<cr>*/<esc>=2kjA

" Save buffer and execute tape test
nnoremap <buffer> <leader>te :w<cr>:!node<space>%<space><bar><space>tap-spec<cr>

nnoremap <buffer> <leader>to $?^test<cr>3la.only<esc>0
nnoremap <buffer> <leader>ts $?^test<cr>3la.skip<esc>0
nnoremap <buffer> <leader>tn $?^test<cr>f.dt(0

" Tape snippets
inoremap <buffer> ;tc test('', assert => {<cr><cr>assert.end();<cr>});<esc>3k$F'i
inoremap <buffer> ;all assert.equal(, <++>, <++>);<esc>T(i
inoremap <buffer> ;alt assert.equal(, true, <++>);<esc>T(i
inoremap <buffer> ;alf assert.equal(, false, <++>);<esc>T(i
inoremap <buffer> ;at assert.throws(, <++>, <++>);<esc>T(i
inoremap <buffer> ;as 'given<space><space>should<space><++>'<esc>2bhi

