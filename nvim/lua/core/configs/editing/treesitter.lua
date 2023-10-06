require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'c', 'lua', 'python', 'vimdoc',  'vim',
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['aa'] = { query = '@parameter.outer', desc = 'select around argument', },
                ['if'] = { query = '@function.inner', desc = 'select inside function', },
                ['af'] = { query = '@function.outer', desc = 'select around function', },
                ['ic'] = { query = '@class.inner', desc = 'select inside class', },
                ['ac'] = { query = '@class.outer', desc = 'select around class', },
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
    }
})
