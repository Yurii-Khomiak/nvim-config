-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.g.clipboard = {
    name = 'xsel',
    copy = {
        ['+'] = 'xsel -ib',
        ['*'] = 'xsel -ip',
    },
    paste = {
        ['+'] = 'xsel -ob',
        ['*'] = 'xsel -op',
    },
    cache_enabled = true,
}
