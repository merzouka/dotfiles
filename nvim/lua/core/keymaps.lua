-- copying/pasting from/to system clipbaord
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<Esc>"+pa')

-- setting normal mode entry
vim.keymap.set('i', '²', '<Esc>')
vim.keymap.set('v', '²', '<Esc>')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- quickfix: 
vim.keymap.set("n", "qj", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "qk", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- load previous buffer info
vim.keymap.set("n", "<leader>l", "<cmd>:loadview<CR>")

-- toggle case
vim.keymap.set("v", "~", "~gv")

-- search selection
vim.keymap.set("v", "/", "<Esc>/\\%V")

-- file browser
vim.keymap.set({ "n", "i" }, "<C-n>", "<cmd>Explore<CR>")
