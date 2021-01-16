local builtin = require('telescope.builtin')

local get_dirname = function(str)
  return str:match("(.*[/\\])")
end

local MyApi = {}

function MyApi.search_dir_with_current_file()
  builtin.find_files{ cwd = get_dirname(vim.fn.expand("%")) }
end

function MyApi.search_nvim_config()
  builtin.git_files{ cwd = "~/.config/nvim" }
end

function MyApi.search_telescope_sources()
  builtin.find_files{ cwd = "~/.config/nvim/plugged/telescope.nvim" }
end

function MyApi.find_current_word()
  local current_word = vim.fn.expand("<cword>")
  builtin.grep_string{
    prompt_title = "Search: " .. current_word,
    search = current_word
  }
end

function MyApi.live_grep()
  builtin.live_grep()
end

function MyApi.find_word_in_telescope_sources()
  builtin.live_grep{
    cwd = "~/.config/nvim/plugged/telescope.nvim",
  }
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

