require("fidget").setup()

-- hexokinase
vim.cmd("let g:Hexokinase_highlighters = [ 'virtual' ]")
vim.cmd("let g:Hexokinase_optInPatterns = [ 'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names' ]")

-- undotree mapping
vim.keymap.set('n', '<leader>uh', vim.cmd.UndotreeToggle, { desc = '[U]ndo[H]istory' })
require("dressing").setup()
