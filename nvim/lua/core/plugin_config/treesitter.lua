require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "lua", "rust", "vim", "php", "python", "javascript", 
    "phpdoc"
},

  -- install 'ensure_installed' parsers
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
