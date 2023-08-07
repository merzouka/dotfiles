vim.o.termguicolors = true
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'onedark'
	}
}

