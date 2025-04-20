local config_my_rasmus = function()
    local white = "#ffffff"
    local gray = "#c2c0c0"
    local green = "#64b54a"
    local blue = "#b3cff2"
    local cyan = "#7bb099"
    local none = "NONE"

    -- Use :Telescope highlights to browser through all groups
    -- TS groups start with @
    vim.g.rasmus_variant = "dark"
    vim.g.rasmus_custom_hl_groups = {
        Comment = { fg = green, bg = none, bold = false, italic = false },
        DiagnosticUnnecessary = { fg = gray, bg = none, bold = false, italic = false },
        Conditional = { fg = white, bg = none, bold = false, italic = false },
        Keyword = { fg = white, bg = none, bold = false, italic = false },
        Identifier = { fg = gray, bg = none },
        Operator = { fg = gray, bg = none, bold = false, italic = false },
        TSVariable = { fg = gray, bold = false, italic = false }, -- Any variable name that does not have another highlight.
        Type = { fg = cyan, bold = false, italic = false },
    }

    vim.g.rasmus_hl_custom_groups = function(utils)
        utils.highlight("@variable", { fg = gray })
        utils.highlight("@type", { fg = cyan })
        utils.highlight("@type.builtin", { fg = cyan })
        utils.highlight("@function", { fg = blue })
        utils.highlight("@function.method", { fg = blue })
    end

    vim.cmd.colorscheme "rasmus"
end

return {
    {
        "Yurii-Khomiak/rasmus.nvim",
        -- dir = "~/myprojects/nvim/rasmus",
        enabled = true,
        priority = 1000,
        config = config_my_rasmus,
    },

}
