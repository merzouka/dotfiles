require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers
})

On_attach = function(_, _)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
end

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup { on_attach = On_attach }
    end
}

