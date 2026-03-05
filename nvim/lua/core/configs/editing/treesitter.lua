-- nvim-treesitter: install parsers
local ts = require('nvim-treesitter')
ts.install({ 'c', 'lua', 'python', 'vimdoc', 'vim' }):wait(30000)

-- Enable features per-filetype via autocmd
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter_features', { clear = true }),
    callback = function(ev)
        local lang = ev.match
        -- auto-install parser for any new filetype
        pcall(function()
            ts.install({ lang }):wait(10000)
        end)
        -- enable highlighting
        pcall(vim.treesitter.start, ev.buf, lang)
        -- enable indentation (uncomment if you want it)
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- nvim-treesitter-textobjects
require('nvim-treesitter-textobjects').setup({
    select = { lookahead = true },
    move  = { set_jumps = true },
})

local select = require('nvim-treesitter-textobjects.select')
local swap   = require('nvim-treesitter-textobjects.swap')

vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, { desc = 'select around argument' })
vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, { desc = 'select inside function' })
vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, { desc = 'select around function' })
vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'select inside class' })
vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end, { desc = 'select around class' })

vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner') end,     { desc = 'swap with next argument' })
vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end, { desc = 'swap with previous argument' })
