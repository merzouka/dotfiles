-- leader: -------------------------------------------------------------------- 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- tabs: ----------------------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true


-- line numbers: --------------------------------------------------------------
vim.opt.nu = true
vim.opt.relativenumber = true

-- line wrapping: -------------------------------------------------------------
vim.opt.wrap = false

-- undotree related: ----------------------------------------------------------
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search: --------------------------------------------------------------------
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- terminal colors: -----------------------------------------------------------
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

-- spell checking ------------------------------------------------------------
vim.opt.spelllang = 'en_us'
vim.opt.spell = true 
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.cmd([[
            hi clear SpellBad
            hi SpellBad cterm=underline
            hi SpellBad gui=undercurl
        ]])
    end
})

-- auto indent on new line
vim.cmd("set autoindent")

-- folds ---------------------------------------------------------------------
vim.cmd([[ 
    augroup saveFolds
        au VimLeave * :mkview
    augroup END
]])
