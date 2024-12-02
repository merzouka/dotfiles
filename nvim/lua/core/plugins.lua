local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- neovim json configuration
    {
        'folke/neoconf.nvim',
        cmd = 'Neoconf',
        init = function ()
            require("neoconf").setup()
        end,
        opts = {
            priority = 50,
        }
    },

    -- files
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    'theprimeagen/harpoon',
    {
        'mbbill/undotree',
        enabled = true,
    },

    -- lsp stuff
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim', -- add vim api functionality to lua_la
            {
                'williamboman/mason.nvim',
                config = true, -- use default config
            },
            {
                'j-hui/fidget.nvim',
                tag = 'legacy',
                opts = {}, -- call require('fidget')
            },
        },
    },
    -- typescript
    {
        "pmizio/typescript-tools.nvim",
        enabled = false,
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
        opts = {
        },
    },

    -- completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- snippets engine
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- lsp completion
            'hrsh7th/cmp-nvim-lsp',

            -- friendly snippets
            'rafamadriz/friendly-snippets',

            -- other completion
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- 'hrsh7th/cmp-cmdline',
        },
    },

    -- themes
    'ribru17/bamboo.nvim',
    'AlexvZyl/nordic.nvim',
    "rebelot/kanagawa.nvim",
    'navarasu/onedark.nvim',
    'ellisonleao/gruvbox.nvim',
    'Mofiqul/dracula.nvim',
    {
        'neanias/everforest-nvim',
        config = function()
            vim.cmd.colorscheme 'everforest'
        end,
    },

    -- status line
    {
        'nvim-lualine/lualine.nvim',
        enabled = false,
    },

    -- commenting
    'numToStr/Comment.nvim',

    -- Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                -- only runs if make is installed
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function ()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- editing
    --      treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    'lervag/vimtex',

    --      folds
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
        },
    },

    --      tags/quotation marks
    'windwp/nvim-ts-autotag',
    "kylechui/nvim-surround",
    "m4xshen/autoclose.nvim",

    --      undotree
    'mbbill/undotree',

    --      refactoring
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },


    -- debugging
    {
        'mfussenegger/nvim-dap',
        enabled = false,
    },
    {
        'rcarriga/nvim-dap-ui',
        enabled = false,
        dependencies = {
            "nvim-neotest/nvim-nio",
        },
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        enabled = false,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        enabled = false,
    },

    -- tmux
    "christoomey/vim-tmux-navigator",

    -- visual
    -- 'norcalli/nvim-colorizer.lua',
    {
        'rrethy/vim-hexokinase',
        build = "make hexokinase"
    },

    -- linting
    'mfussenegger/nvim-lint',

    -- formatting
    'mhartington/formatter.nvim',

    -- specialized
    -- latex
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here
            vim.g.vimtex_view_method = "zathura"
        end
}

}, {})

