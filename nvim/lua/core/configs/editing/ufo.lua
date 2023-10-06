vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ufo = require('ufo')
ufo.setup({
    provider_selector = function(_, _, _)
        return {'treesitter', 'indent'}
    end
})

vim.keymap.set('n', 'zr', ufo.openAllFolds)
vim.keymap.set('n', 'zm', ufo.closeAllFolds)


