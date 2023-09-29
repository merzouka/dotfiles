require("lint").linters_by_ft = {
    css = {"stylelint"},
    html = {"markuplint"},
    typescript = {"eslint"},
    javascript = {"eslint"},
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function ()
        require("lint").try_lint()
    end
})
