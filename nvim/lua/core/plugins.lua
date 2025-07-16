-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Git
    {
        'tpope/vim-fugitive',
        config = function ()
            vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = "[G]it [S]tatus" })
            vim.keymap.set('n', '<leader>do', ':Git difftool<CR>', { desc = "[D]ifftool [O]pen" })
        end,
        dependencies = { 'lewis6991/gitsigns.nvim' },
    },
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
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/neodev.nvim', -- add vim api functionality to lua_la
            {
                'j-hui/fidget.nvim',
            },
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
        enabled = true,
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
    {
        'rrethy/vim-hexokinase',
        build = "make hexokinase"
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },

    -- linting
    'mfussenegger/nvim-lint',

    -- formatting
    'mhartington/formatter.nvim',

}, {})

