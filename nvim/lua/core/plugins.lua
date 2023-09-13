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
        tag="0.1.0",
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use "williamboman/mason.nvim"

    -- lsp
    use {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }

    use "Townk/vim-autoclose"
    use "christoomey/vim-tmux-navigator"

    -- autocompletion
    use {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    }

    -- snippets
    use {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    }

    -- color schemes
    use {
        'ribru17/bamboo.nvim',
        'neanias/everforest-nvim',
        'AlexvZyl/nordic.nvim',
        "rebelot/kanagawa.nvim",
        'navarasu/onedark.nvim',
        'ellisonleao/gruvbox.nvim',
        'Mofiqul/dracula.nvim',
    }

    -- folding
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    -- debugger
    use {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'jay-babu/mason-nvim-dap.nvim',
    }

    -- auto closing tag
    use 'windwp/nvim-ts-autotag'

    use 'norcalli/nvim-colorizer.lua'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
	vim.cmd("PackerInstall")
end)


