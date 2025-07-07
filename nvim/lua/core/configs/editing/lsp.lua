-- helper
function nmap(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { desc = desc })
end

-- lsp keybindings
nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
nmap('gd', vim.lsp.buf.definition, '[G]o [D]efinition')
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('gr', require('telescope.builtin').lsp_references, '[G]et [R]eference')
nmap('gi', require('telescope.builtin').lsp_implementations, '[G]et [I]mplementation')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<leader>do', vim.lsp.buf.signature_help, '[D]ocumentation [O]pen')

nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- create a command ':LspFormat' for local lsp formatting
vim.api.nvim_buf_create_user_command(0, 'Format', function(_)
    vim.lsp.buf.format()
end, { desc = 'Format current buffer with LSP' })

require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "bashls", "pyright", "clangd", "ts_ls", "gopls", "yamlls"
    },
})

-- YAML Language Server Configuration
vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
            },
            validate = false,
            schemas = {
                kubernetes = { "k8s-*.{yaml,yml}", "k8s/**/*.{yaml,yml}" },
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                    "docker-compose*.{yaml,yml}",
                    "compose*.{yaml,yml}"
                },
            },
        },
    },
})

-- set up neodev for lua vim support
require('neodev').setup()

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false
