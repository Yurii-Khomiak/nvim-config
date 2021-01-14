" Indentation
setlocal shiftwidth=2 softtabstop=2

" Snippets
inoremap <buffer> ;b \textbf{
inoremap <buffer> ;i \emph{
inoremap <buffer> ;li \item{}<cr><++><esc>k$F{a
inoremap <buffer> ;lo \begin{enumerate}<cr>\end{enumerate}<esc>
			\O\item{}<cr><++><esc>k$F{a
inoremap <buffer> ;lu \begin{itemize}<cr>\end{itemize}<esc>
			\O\item{}<cr><++><esc>k$F{a

