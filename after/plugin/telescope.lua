local builtin = require('telescope.builtin')
local MyApi = require('yuk.telescope.api')

local setkm = function(...)
    vim.keymap.set(...)
end

setkm('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
setkm('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it' })
setkm('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
setkm('n', '<leader>sr', builtin.buffers, { desc = '[S]earch [B]uffers' })

setkm('n', '<leader>sw', MyApi.search_word, { desc = '[S]earch [W]ord' })
setkm('n', '<leader>s*', MyApi.find_current_word, { desc = '[S]earch current [W]ord' })
setkm('n', '<leader>sk', MyApi.search_dir_with_current_file, { desc = '[S]earch directory with [K]urrent file' })
setkm('n', '<leader>sc', MyApi.search_nvim_config, { desc = '[S]earch nvim [C]onfig' })

