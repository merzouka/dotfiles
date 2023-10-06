-- server specific settings
local servers = {
    html = {
        filetypes = {
            'html', 'twig', 'hbs',
        }
    }
}

-- helper
function nmap(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- lsp keybindings 
local on_attach = function (_, bufnr)
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]o [D]efinition')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]o [R]eference')
    nmap('gi', require('telescope.builtin').lsp_implementations, '[G]o [I]mplementation')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>do', vim.lsp.buf.signature_help, '[D]ocumentation [O]pen')

    nmap('<leader>wl', function ()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- create a command ':LspFormat' for local lsp formatting
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- extra lsp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
    },
})

-- automatically set up servers
mason_lspconfig.setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filtypes = (servers[server_name] or {}).filetypes,
        })
    end
})

-- set up neodev for lua vim support
require('neodev').setup()
