local setup_telescope = function(mappings)
  local setting = {
    defaults = {
      prompt_prefix = ' >',
      prompt_position = "top",

      sorting_strategy = "ascending",

      file_sorter = require('telescope.sorters').get_fzy_sorter,

      mappings = mappings
    }
  }
  require('telescope').setup(setting)
  return setting
end

return setup_telescope

