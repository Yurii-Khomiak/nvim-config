local setup_telescope = function(mappings)
  local setting = {
    defaults = {
      prompt_prefix = ' >',
      prompt_position = "top",

      preview_cutoff = 120,

      sorting_strategy = "ascending",

      file_sorter = require('telescope.sorters').get_fzy_sorter,

      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

-- turn off preview (maybe there's better way)
--       layout_strategy = 'horizontal',
--       layout_defaults = {
--         horizontal = {
--           preview_width = 0.0,
--         },
--         vertical = {
--           preview_height = 0.0,
--         }
--       },

      mappings = mappings
    }
  }
  require('telescope').setup(setting)
  return setting
end

return setup_telescope

