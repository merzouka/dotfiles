vim.o.termguicolors = true
require('nordic').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'nordic'
	}
}

