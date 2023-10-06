require('formatter').setup({
    filetype = {
        javascript = {
            require('formatter.filetypes.javascript').prettier,
        },
        typescript = {
            require('formatter.filetypes.typescript').prettier,
        },
        html = {
            require('formatter.filetypes.html').prettier,
        },
        css = {
            require('formatter.filetypes.css').prettier,
        },
    }
})

-- format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWrite",
})
