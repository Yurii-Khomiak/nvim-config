local config = function()
    require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
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
        name = "rose-pine",
        config = config
    },
}
