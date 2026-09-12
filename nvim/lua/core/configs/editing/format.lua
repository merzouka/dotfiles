require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        rust = { "rustfmt" },
        c = { "clang-format" },
        python = { "black" },
        sql = { "sqlfluff" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        dockerfile = { "dockerfmt" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
