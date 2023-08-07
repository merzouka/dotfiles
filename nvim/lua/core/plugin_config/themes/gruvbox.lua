vim.o.termguicolors = true
require('gruvbox').load()

require('lualine').setup {
	options = {
		icons_enabled = true,
    		theme = 'gruvbox'
	}
}

