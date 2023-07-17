vim.g.netrw_banner = 0 
vim.g.netrw_winsize = 40
vim.g.netrw_browse_split = 4
vim.g.netrw_bufsettings = 'nu rnu'

-- open netrw on the side
vim.keymap.set("n", "<leader>=", ":lefta :winc v <bar> :Ex <bar> :vertical resize 40 <bar><cr>");

