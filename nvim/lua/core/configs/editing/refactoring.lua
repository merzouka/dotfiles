local langs = {
    go = true,
    cpp = true,
    c = true,
    h = true,
    java = true,
    typescript = true,
    php = true,
}

require("refactoring").setup({
    prompt_func_return_type = langs,
    prompt_func_param_type = langs,
})

vim.keymap.set({"n", "v", "x"}, "<leader>rr", function() require('refactoring').select_refactor() end)
