vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = "*.r",
    callback = function ()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end
})
