vim.o.termguicolors = true
require('kanagawa').load("wave")

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'kanagawa'
	}
}

