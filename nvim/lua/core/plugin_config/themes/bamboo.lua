vim.o.termguicolors = true
require('bamboo').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'bamboo'
	}
}

