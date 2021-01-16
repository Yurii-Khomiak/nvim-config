" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>
fun! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		if has('nvim')
			lua vim.lsp.buf.hover()
		else
			call CocAction('doHover')
		endif
	endif
endfunction

if !has('nvim')
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
endif

