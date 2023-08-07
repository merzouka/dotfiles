vim.o.termguicolors = true
require('everforest').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'everforest'
	}
}

