if !has('nvim')
	let g:fzf_layout = {
				\'up':'~90%',
				\'window': {
				\'width': 0.6,
				\'height': 0.6,
				\'yoffset': 0.2,
				\'xoffset': 0.5,
				\'border': 'sharp'
				\}
				\}
	let g:fzf_preview_window='' " Fix weird windows input behaviour

	let $FZF_DEFAULT_OPTS = '--height 40% --layout=reverse --border'
	if has("win32")
		let $FZF_DEFAULT_OPTS = '--layout=reverse --border'
	endif

	nnoremap <leader>fb :Buffers<cr>
	nnoremap <leader>ff :Files<cr>
	nnoremap <leader>fg :GFiles<cr>
endif

