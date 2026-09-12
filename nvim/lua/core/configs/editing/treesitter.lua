require('nvim-treesitter').setup({})

require('nvim-treesitter').install({
    'c', 'lua', 'python', 'vimdoc', 'vim', 'rust', 'bash', 'yaml',
    'javascript', 'typescript', 'tsx', 'jsx', 'go', 'sql', 'html',
    'css', 'dockerfile', 'json', 'markdown', 'markdown_inline',
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.bo.smartindent = false
        vim.bo.autoindent = false
    end,
})

require('nvim-treesitter-textobjects').setup({
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = 'V',
        },
        include_surrounding_whitespace = false,
    },
})

local select = require("nvim-treesitter-textobjects.select").select_textobject

vim.keymap.set({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "select around function" })
vim.keymap.set({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "select inside function" })
vim.keymap.set({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "select around class" })
vim.keymap.set({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "select inside class" })
vim.keymap.set({ "x", "o" }, "aa", function() select("@parameter.outer", "textobjects") end, { desc = "select around argument" })
vim.keymap.set({ "x", "o" }, "ia", function() select("@parameter.inner", "textobjects") end, { desc = "select inside argument" })

local swap = require("nvim-treesitter-textobjects.swap")

vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner") end, { desc = "swap with next parameter" })
vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.outer") end, { desc = "swap with previous parameter" })

local move = require("nvim-treesitter-textobjects.move")

vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "next function start" })
vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "next class start" })
vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "previous function start" })
vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "previous class start" })
vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "next function end" })
vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "previous function end" })
