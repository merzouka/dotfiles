-- see if language added in refactoring.nvim if needed
require('refactoring').setup({
    -- prompt for return type
    prompt_func_return_type = {
        ts = true,
        php = true,
        ruby = true,
        python = true,
        go = true,
        cpp = true,
        c = true,
        h = true,
        java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
        ts = true,
        php = true,
        ruby = true,
        python = true,
        go = true,
        cpp = true,
        c = true,
        h = true,
        java = true,
    },
})

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")
vim.keymap.set(
    {"n", "x"},
    "<leader>rr",
    function() require('telescope').extensions.refactoring.refactors() end
)
-- Note that not all refactor support both normal and visual mode
