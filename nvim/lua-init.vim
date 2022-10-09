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
lua require("plugin-config.toggleterm")
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

"for file in split(glob("~/.config/nvim/container/*.vim"), '\n')
"    exe 'source' file
"endfor

