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
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    'theprimeagen/harpoon',

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
            -- 'hrsh7th/cmp-buffer',
            -- 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
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
    'nvim-lualine/lualine.nvim',

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
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'jay-babu/mason-nvim-dap.nvim',

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
        init = function()
            -- Use init for configuration, don't use the more common "config".
        end
    },
    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        event = {
          -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
          -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
          "BufReadPre ".. vim.fn.expand("~") .."/notes/obsidian/**/*.md",
          "BufNewFile ".. vim.fn.expand("~") .."/notes/obsidian/**/*.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup {

                -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
                --
                completion = {
                    -- Set to false to disable completion.
                    nvim_cmp = true,
                    -- Trigger completion at 2 chars.
                    min_chars = 2,
                },
                -- Where to put new notes. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "current_dir",

                -- Optional, customize how wiki links are formatted. You can set this to one of:
                --  * "use_alias_only", e.g. '[[Foo Bar]]'
                --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
                --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
                --  * "use_path_only", e.g. '[[foo-bar.md]]'
                -- Or you can set it to a function that takes a table of options and returns a string, like this:
                wiki_link_func = function(opts)
                    return require("obsidian.util").wiki_link_id_prefix(opts)
                end,

                -- Optional, customize how markdown links are formatted.
                markdown_link_func = function(opts)
                    return require("obsidian.util").markdown_link(opts)
                end,

                -- Either 'wiki' or 'markdown'.
                preferred_link_style = "wiki",

                -- Optional, for templates (see below).
                templates = {
                    subdir = "templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M",
                    -- A map for custom variables, the key should be the variable and the value a function
                    substitutions = {},
                },

                -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
                -- URL it will be ignored but you can customize this behavior here.
                ---@param url string
                -- follow_url_func = function(url)
                --     -- Open the URL in the default web browser.
                --     -- vim.fn.jobstart({"open", url})  -- Mac OS
                --     vim.fn.jobstart({"xdg-open", url})  -- linux
                -- end,
                --
                -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
                open_app_foreground = false,

                -- Optional, sort search results by "path", "modified", "accessed", or "created".
                -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
                -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
                sort_by = "modified",
                sort_reversed = true,

                -- Optional, determines how certain commands open notes. The valid options are:
                -- 1. "current" (the default) - to always open in the current window
                -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
                -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
                open_notes_in = "current",

                -- Optional, define your own callbacks to further customize behavior.
                callbacks = {
                    -- Runs at the end of `require("obsidian").setup()`.
                    ---@param client obsidian.Client
                    post_setup = function(client) end,

                    -- Runs anytime you enter the buffer for a note.
                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    enter_note = function(client, note) end,

                    -- Runs anytime you leave the buffer for a note.
                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    leave_note = function(client, note) end,

                    -- Runs right before writing the buffer for a note.
                    ---@param client obsidian.Client
                    ---@param note obsidian.Note
                    pre_write_note = function(client, note) end,

                    -- Runs anytime the workspace is set/changed.
                    ---@param client obsidian.Client
                    ---@param workspace obsidian.Workspace
                    post_set_workspace = function(client, workspace) end,
                },

                -- Specify how to handle attachments.
                attachments = {
                    -- The default folder to place images in via `:ObsidianPasteImg`.
                    -- If this is a relative path it will be interpreted as relative to the vault root.
                    -- You can always override this per image by passing a full path to the command instead of just a filename.
                    img_folder = "assets/imgs",  -- This is the default
                    -- A function that determines the text to insert in the note when pasting an image.
                    -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
                    -- This is the default implementation.
                    ---@param client obsidian.Client
                    ---@param path obsidian.Path the absolute path to the image file
                    ---@return string
                    img_text_func = function(client, path)
                        path = client:vault_relative_path(path) or path
                        return string.format("![%s](%s)", path.name, path)
                    end,
                },
            }
        end,
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/notes/obsidian/personal",
                },
            },
        },
    }

}, {})

