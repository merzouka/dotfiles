require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls", "clangd", "dockerls", "tsserver", "marksman", "intelephense",
        "pyright", "rust_analyzer", "lua_ls", "codelldb"
    },
})

local on_attach = function(_, _)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end


require("lspconfig").bashls.setup { on_attach = on_attach }
require("lspconfig").clangd.setup { on_attach = on_attach }
require("lspconfig").dockerls.setup { on_attach = on_attach }
require("lspconfig").tsserver.setup { on_attach = on_attach }
require("lspconfig").marksman.setup { on_attach = on_attach }
require("lspconfig").intelephense.setup { on_attach = on_attach }
require("lspconfig").pyright.setup { on_attach = on_attach }
require("lspconfig").rust_analyzer.setup { on_attach = on_attach }
require("lspconfig").lua_ls.setup { on_attach = on_attach }

