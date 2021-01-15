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

function MyApi.search_telescope_sources()
  builtin.find_files{ cwd = "~/.config/nvim/plugged/telescope.nvim" }
end

function MyApi.find_word_in_telescope_sources()
  builtin.grep_string{
    cwd = "~/.config/nvim/plugged/telescope.nvim",
    search = vim.fn.input("grep > ")
  }
end

function MyApi.find_current_word()
  builtin.grep_string{ search = vim.fn.expand("<cword>") }
end

function MyApi.find_word()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end

local create_api = function()
  return setmetatable({}, {
      __index = function(_, k)
        if MyApi[k] then
          return MyApi[k]
        else
          return require('telescope.builtin')[k]
        end
      end
    })
end

return create_api

