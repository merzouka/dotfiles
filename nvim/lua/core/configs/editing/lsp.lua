-- server specific settings
local servers = {
    clangd = {},
    pyright = {},
    bashls = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    html = {
        filetypes = {
            'html', 'twig', 'hbs',
        }
    },

    lua_ls = {
        -- cmd = {...},
        -- filetypes { ...},
        -- capabilities = {},
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = {
                    checkThirdParty = false,
                    -- Tells lua_ls where to find all the Lua files that you have loaded
                    -- for your neovim configuration.
                    library = {
                        '${3rd}/luv/library',
                        unpack(vim.api.nvim_get_runtime_file('', true)),
                    },
                    -- If lua_ls is really slow on your computer, you can try this instead:
                    -- library = { vim.env.VIMRUNTIME },
                },
                completion = {
                    callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            },
        },
    },
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
    ensure_installed = vim.tbl_keys(servers or {}),
})

-- automatically set up servers
mason_lspconfig.setup_handlers({
    function(server_name)
        -- if server_name == "tsserver" then
        --     return
        -- end
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

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false
