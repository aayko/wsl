return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=always',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
                '-u',
            },
            layout_config = {
                horizontal = {
                    preview_cutoff = 100,
                },
            },
            file_ignore_patterns = {
                ".git/",
                ".cache",
                "%.o",
                "%.a",
                "%.out",
                "%.class",
                "%.pdf",
                "%.mkv",
                "%.mp4",
                "%.zip"
            },
        },
        pickers = {
            find_files = {
                hidden= true,
                find_commands = {
                    '--no-ignore-vcs',
                },
            },
        },
    },
    config = function(_, opts)
        local builtin = require('telescope.builtin')
        local telescope = require('telescope')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>ps', builtin.lsp_dynamic_workspace_symbols, {})
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>pc', '<CMD>cd $HOME/.config/nvim<CR>', {})
    end,
}
