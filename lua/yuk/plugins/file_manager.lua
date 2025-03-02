local is_oil_enabled = true
local file_manager_binding = "<leader>="

if is_oil_enabled then
    local config_oil = function()
        require("oil").setup({
            keymaps = {
                ["<C-p>"] = "actions.preview",
                ["<C-l>"] = "actions.refresh",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
            },
        })

        vim.keymap.set("n", file_manager_binding, "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end

    return {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = config_oil,
    }
else
    -- use netrw as file manager

    vim.g.netrw_banner = 0
    vim.g.netrw_winsize = 40
    vim.g.netrw_browse_split = 4
    vim.g.netrw_bufsettings = 'nu rnu'

    -- open netrw on the side
    vim.keymap.set("n", file_manager_binding, ":lefta :winc v <bar> :Ex <bar> :vertical resize 40 <bar><cr>");

    return {}
end

