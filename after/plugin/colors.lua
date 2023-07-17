require('rose-pine').setup({
	-- --- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'main',
	-- --- @usage 'main'|'moon'|'dawn'
	-- dark_variant = 'main',
	-- bold_vert_split = false,
	disable_background = true,
	disable_float_background = true,
        disable_italics = true,

	-- --- @usage string hex value or named color from rosepinetheme.com/palette
	-- groups = {
	-- 	background = 'base',
	-- 	background_nc = '_experimental_nc',
	-- 	panel = 'surface',
	-- 	panel_nc = 'base',
	-- 	border = 'highlight_med',
	-- 	comment = 'muted',
	-- 	link = 'iris',
	-- 	punctuation = 'subtle',

	-- 	error = 'love',
	-- 	hint = 'iris',
	-- 	info = 'foam',
	-- 	warn = 'gold',

	-- 	headings = {
	-- 		h1 = 'iris',
	-- 		h2 = 'foam',
	-- 		h3 = 'rose',
	-- 		h4 = 'gold',
	-- 		h5 = 'pine',
	-- 		h6 = 'foam',
	-- 	}
	-- 	-- or set all headings at once
	-- 	-- headings = 'subtle'
	-- },

	-- -- Whether or not highlight_groups optios should change only only update
	-- -- the settings they touch or should reset the entire highlight_group.
	-- respect_default_highlight_groups = true,

	-- -- Change specific vim highlight groups
	-- -- https://github.com/rose-pine/neovim/wiki/Recipes
	-- highlight_groups = {
	-- 	ColorColumn = { bg = 'rose' },

	-- 	-- Blend colours against the "base" background
	-- 	CursorLine = { bg = 'foam', blend = 10 },
	-- 	StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	-- }
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')

