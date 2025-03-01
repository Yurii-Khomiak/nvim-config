local config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = require'lualine.themes.base16',
            section_separators = '',
            component_separators = '',
        },
    }
end

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = config,
    },
}
