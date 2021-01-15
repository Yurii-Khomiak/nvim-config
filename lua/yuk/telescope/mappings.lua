local actions = require('telescope.actions')

-- from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/mappings.lua
local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
    "<cmd>lua require('yuk.telescope')['%s'](%s)<CR>",
    f,
    options and vim.inspect(options, { newline = '' }) or ''
    )
  local options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

local define_mappings = function()
  map_tele('<leader>ff', 'fd')
  -- k for 'kurrent'
  map_tele('<leader>fk', 'search_dir_with_current_file')
  map_tele('<leader>fw', 'find_current_word')
  map_tele('<leader>fW', 'find_word')
  map_tele('<leader>fc', 'search_nvim_config')
  map_tele('<leader>f`', 'search_telescope_sources')
  map_tele('<leader>f~', 'find_word_in_telescope_sources')
end

local setup_mappings = {
}

return {
  setup = setup_mappings,
  define = define_mappings,
}

