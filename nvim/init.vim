lua require('basic')
lua require('key-bindings')
lua require('plugins')
lua require('lsp.lsp-collection')
lua require('plugin-config.plugins-collection')
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
