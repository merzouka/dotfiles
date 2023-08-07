vim.o.termguicolors = true
require('dracula').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'dracula'
	}
}

