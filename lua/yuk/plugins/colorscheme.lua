local config_rose_pine = function()
    require("rose-pine").setup({
        variant = "main",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn

        styles = {
            bold = true,
            italic = true,
            transparency = false,
        },

        palette = {
            main = {
                base = '#121111',
            },
        },
    })

    vim.cmd.colorscheme "rose-pine"
end

return {
    {
        "rose-pine/neovim",
        enabled = false,
        name = "rose-pine",
        config = config_rose_pine,
    },
    {
        "Yurii-Khomiak/rasmus.nvim",
        -- dir = "~/myprojects/nvim/rasmus",
        enabled = true,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true

            vim.g.rasmus_italic_comments = false
            vim.g.rasmus_bold_keywords = true
            vim.g.rasmus_variant = "dark"
            vim.cmd.colorscheme "rasmus"
        end,
    },

}
