return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',

        version = '*',
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
            },

            signature = { enabled = true },
        }
    }
}
