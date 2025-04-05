local config_undotree = function()
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_RelativeTimestamp = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_SplitWidth = 40

    vim.keymap.set("n", "<leader>U", "<CMD>UndotreeToggle<CR>", {})
end

return {
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    {
        "mbbill/undotree",
        config = config_undotree,
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 1,
                width = 80,
                height = 1,
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false,     -- disable cursorline
                    cursorcolumn = false,   -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            }
        }
    }
}
