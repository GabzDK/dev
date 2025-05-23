return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require('telescope').setup{
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                buffers = {
                    theme = "ivy",
                },
                help_tags= {
                    theme = "ivy",
                }
            },
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-x><C-f>', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-x><C-g>', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<C-x><C-b>', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
