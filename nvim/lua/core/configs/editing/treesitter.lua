-- 1. Initialize core nvim-treesitter
local ts = require('nvim-treesitter')
ts.setup({})

-- 2. Install your required language parsers
ts.install({ 'c', 'lua', 'python', 'vimdoc', 'vim', 'rust', 'bash', 'yaml' })

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
        vim.bo.smartindent = false
        vim.bo.autoindent = false
    end,
})

-- 4. Decoupled Textobjects setup (Moved out of nvim-treesitter setup)
require('nvim-treesitter-textobjects').setup({
    select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to matching textobj
        keymaps = {
            ['aa'] = { query = '@parameter.outer', desc = 'select around argument' },
            ['if'] = { query = '@function.inner', desc = 'select inside function' },
            ['af'] = { query = '@function.outer', desc = 'select around function' },
            ['ic'] = { query = '@class.inner', desc = 'select inside class' },
            ['ac'] = { query = '@class.outer', desc = 'select around class' },
        }
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
            ['<leader>A'] = '@parameter.inner',
        },
    }
})
