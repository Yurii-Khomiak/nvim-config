local builtin = require('telescope.builtin')

local get_dirname = function(str)
    return str:match("(.*[/\\])")
end

local MyApi = {}

function MyApi.search_dir_with_current_file()
    builtin.find_files{ cwd = get_dirname(vim.fn.expand("%")) }
end

function MyApi.search_nvim_config()
    builtin.find_files{ cwd = "~/.config/nvim" }
end

function MyApi.search_word()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end

function MyApi.find_current_word()
    local current_word = vim.fn.expand("<cword>")
    builtin.grep_string{
        prompt_title = "Search: " .. current_word,
        search = current_word
    }
end

return MyApi

