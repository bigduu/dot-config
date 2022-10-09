lua require('basic')
lua require('key-bindings')
lua require('plugins')
lua require('plugin-config.nvim-tree') 
lua require('plugin-config.nvim-autopairs')
lua require('plugin-config.nvim-treesitter')
lua require('plugin-config.bufferline')
lua require('plugin-config.telescope')
lua require("plugin-config.dashboard")
lua require("plugin-config.project")
lua require("plugin-config.comment")
lua require("plugin-config.hop")
lua require('lsp.lsp-collection')
lua require('lsp.ui')
lua require('colorscheme')

filetype plugin on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk
set showmatch

if has('syntax')
	syntax enable
	syntax on
endif
let g:code_action_menu_show_details = v:false
let g:code_action_menu_show_diff = v:false
let g:code_action_menu_window_border = 'single'

let g:copilot_node_command = "/Users/bigduu/.config/github-copilot/node/bin/node"
