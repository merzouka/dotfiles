
-- comment visual block using gc '//' or gb '/* */'
require("Comment").setup()

require("nvim-surround").setup()

require("nvim-ts-autotag").setup()

require("autoclose").setup({
   keys = {
      ["|"] = { escape = true, close = true, pair = "||", enabled_filetypes = {"rust"} },
   },
    options = {
        auto_indent = true,
        pair_spaces = false,
    }
})
