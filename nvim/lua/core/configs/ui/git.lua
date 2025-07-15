
vim.keymap.set('n', '<leader>hp', ":Gitsigns preview_hunk_inline<CR>", { desc = '[H]unk [P]review' })
vim.keymap.set('n', '<leader>hs', ":Gitsigns stage_hunk<CR>", { desc = '[H]unk [S]tage' })
vim.keymap.set('n', '<leader>hu', ":Gitsigns undo_stage_hunk<CR>", { desc = '[H]unk [U]stage' })
