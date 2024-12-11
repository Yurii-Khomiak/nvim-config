local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local get_dirname = function(str)
    return str:match("(.*[/\\])")
end

local MyApi = {}

MyApi.search_dir_with_current_file = function()
    builtin.find_files{ cwd = get_dirname(vim.fn.expand('%')) }
end

MyApi.search_nvim_config = function()
    builtin.find_files{ cwd = vim.fn.stdpath('config') }
end

MyApi.search_word = function()
    builtin.grep_string(themes.get_ivy{
        search = vim.fn.input('Grep > ')
    })
end

MyApi.find_current_word = function()
    local current_word = vim.fn.expand("<cword>")
    builtin.grep_string{
        prompt_title = "Search: " .. current_word,
        search = current_word
    }
end

-- for science
MyApi.planets = function()
    builtin.planets({
        show_pluto = true,
        show_moon = true,
    })
end

return MyApi

