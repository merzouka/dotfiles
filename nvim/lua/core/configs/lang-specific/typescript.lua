-- local function ingipath(pattern)
--     return vim.fn.expand("~") .. "/code/inge/website/src/**/" .. pattern
-- end

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = {"*.js", "*.ts", "*.tsx", "*.jsx"},
    callback = function ()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end
})
