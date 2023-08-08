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
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
