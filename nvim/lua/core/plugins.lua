local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    use "windwp/nvim-ts-autotag"
    use "Townk/vim-autoclose"
    use "christoomey/vim-tmux-navigator"
    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- color schemes
    use 'ribru17/bamboo.nvim'
    use 'neanias/everforest-nvim'
    use 'AlexvZyl/nordic.nvim'
    use "rebelot/kanagawa.nvim"
    use 'navarasu/onedark.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'Mofiqul/dracula.nvim'

    -- folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
