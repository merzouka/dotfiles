
-- comment visual block using gc '//' or gb '/* */'
require("Comment").setup()

require("nvim-surround").setup()

require("nvim-ts-autotag").setup()

require("autoclose").setup({
    options = {
        auto_indent = true,
        pair_spaces = false,
    }
})

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
