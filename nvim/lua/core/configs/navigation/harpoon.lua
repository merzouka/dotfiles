
require("harpoon").setup()

vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = '[H]arpoon [A]dd File' })

local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu, { desc = '[H]arpoon [O]pen Menu' })
vim.keymap.set("n", "<leader>hj", function () ui.nav_file(1) end, { desc = '[H]arpoon Latest' })
vim.keymap.set("n", "<leader>hk", function () ui.nav_file(2) end, { desc = '[H]arpoon Second To Latest' })
