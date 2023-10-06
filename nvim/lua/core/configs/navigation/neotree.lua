
-- keymaps
vim.keymap.set('n', '<C-n>', ':Neotree toggle<cr>', { desc = '[N]eotree Toggle' })

-- configuration
-- Note: only listed useful mappings
require('neo-tree').setup({
    mappings = {
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["l"] = "focus_preview",
        ["e"] = "rename",
        ["d"] = "delete",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_to_clipboard",
    },
    window = {
        mappings = {
            ["/"] = "fuzzy_finder",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
        },
    },

})
