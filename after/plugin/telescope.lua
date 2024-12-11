local builtin = require('telescope.builtin')
local MyApi = require('yuk.telescope.api')

local setkm = vim.keymap.set

setkm('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
setkm('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it' })
setkm('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
setkm('n', '<leader>sr', builtin.buffers, { desc = '[S]earch [R]ecent' })
setkm('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
setkm('n', '<leader>sp', builtin.pickers, { desc = '[S]earch [P]ickers' })
setkm('n', '<leader>su', builtin.resume, { desc = '[S]earch res[U]me' })

setkm('n', '<leader>sw', MyApi.search_word, { desc = '[S]earch [W]ord' })
setkm('n', '<leader>s*', MyApi.find_current_word, { desc = '[S]earch current [W]ord' })
setkm('n', '<leader>sk', MyApi.search_dir_with_current_file, { desc = '[S]earch directory with [K]urrent file' })
setkm('n', '<leader>sc', MyApi.search_nvim_config, { desc = '[S]earch nvim [C]onfig' })
setkm('n', '<leader>sP', MyApi.planets, { desc = '[S]earch [P]lanets' })

