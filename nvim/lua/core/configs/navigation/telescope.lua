local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- 1. Run core telescope initialization
telescope.setup({
    defaults = {
        -- Optional config can go here
    }
})

-- 2. Safely load extensions after setup
pcall(telescope.load_extension, 'fzf')

-- 3. Set up your navigation keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]ind' })
vim.keymap.set('n', '<leader>gs', builtin.git_files, { desc = '[G]it [S]earch' })
vim.keymap.set('n', '<Space>os', builtin.oldfiles, { desc = '[O]ldfiles [S]earch' })
vim.keymap.set('n', '<leader>pg', function()
    builtin.grep_string({ search = vim.fn.input("> ") })
end, { desc = '[P]roject [G]rep' })

vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = '[D]iagnostics [S]earch' })
vim.keymap.set('n', '<leader>ts', builtin.colorscheme, { desc = '[T]heme [S]earch' })
vim.keymap.set('n', '<C-t>s', builtin.treesitter, { desc = 'Search Treesitter' })
vim.keymap.set('n', '<leader>ms', builtin.help_tags, { desc = '[M]anual [S]earch' })
