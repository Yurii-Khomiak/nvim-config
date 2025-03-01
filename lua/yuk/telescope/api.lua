local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local get_dirname = function(str)
    return str:match("(.*[/\\])")
end

local A = {}

A.search_dir_with_current_file = function()
    builtin.find_files{ cwd = get_dirname(vim.fn.expand('%')) }
end

A.search_nvim_config = function()
    builtin.find_files{ cwd = vim.fn.stdpath('config') }
end

A.search_word = function()
    builtin.live_grep(themes.get_ivy{
        search = vim.fn.input('Grep > ')
    })
end

A.find_current_word = function()
    local current_word = vim.fn.expand("<cword>")
    builtin.grep_string{
        prompt_title = "Search: " .. current_word,
        search = current_word
    }
end

-- for science
A.planets = function()
    builtin.planets({
        show_pluto = true,
        show_moon = true,
    })
end

return A

