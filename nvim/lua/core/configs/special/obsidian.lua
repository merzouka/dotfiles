vim.opt.conceallevel = 2

vim.keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Toggle checbox" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]pen in [O]bsidian" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianNew<CR>", { desc = "[O]bsidian [N]ew note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "[O]bsidian [S]earch" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "[O]bsidian [L]inks" })
