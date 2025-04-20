local defaults = {
    prompt_prefix = ' >',
    prompt_position = "top",

    preview_cutoff = 120,

    sorting_strategy = "ascending",

    file_sorter = require('telescope.sorters').get_fzy_sorter,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    cache_picker = {
        num_pickers = 5,
        limit_entries = 1000,
    },
}

local pickers = {
    find_files = { theme = 'ivy' },
    help_tags = { theme = 'ivy' },
    buffers = { theme = 'ivy' },
    colorscheme = {
        enable_preview = true,
    },
}


local setup_telescope = function()
    require('telescope').setup({
        defaults = defaults,
        pickers = pickers,
    })
end

return setup_telescope
