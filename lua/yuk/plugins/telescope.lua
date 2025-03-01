local config = function()
    require('yuk.telescope')

    local builtin = require('telescope.builtin')
    local A = require('yuk.telescope.api')

    local setkm = vim.keymap.set

    setkm('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    setkm('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it' })
    setkm('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    setkm('n', '<leader>sr', builtin.buffers, { desc = '[S]earch [R]ecent' })
    setkm('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    setkm('n', '<leader>sp', builtin.pickers, { desc = '[S]earch [P]ickers' })
    setkm('n', '<leader>su', builtin.resume, { desc = '[S]earch res[U]me' })

    setkm('n', '<leader>sw', A.search_word, { desc = '[S]earch [W]ord' })
    setkm('n', '<leader>s*', A.find_current_word, { desc = '[S]earch current [W]ord' })
    setkm('n', '<leader>sk', A.search_dir_with_current_file, { desc = '[S]earch directory with [K]urrent file' })
    setkm('n', '<leader>sc', A.search_nvim_config, { desc = '[S]earch nvim [C]onfig' })
    setkm('n', '<leader>sP', A.planets, { desc = '[S]earch [P]lanets' })
end

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = config,
    },
}
