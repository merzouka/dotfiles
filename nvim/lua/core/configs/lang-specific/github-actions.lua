local util = require('lspconfig.util')

require('lspconfig').gh_actions_ls.setup({
    cmd = { 'gh-actions-language-server', '--stdio' },
    filetypes = { 'yaml.github' },
    root_dir = util.root_pattern('.github'),
    single_file_support = true,
    capabilities = {
        workspace = {
            didChangeWorkspaceFolders = {
                dynamicRegistration = true,
            },
        },
    },
})
