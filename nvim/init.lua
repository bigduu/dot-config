require("basic")
require("key-bindings")
require("plugins")
require("plugin-config.plugins-collection")
require("colorscheme")
require("lsp.setup")

vim.api.nvim_command("filetype plugin indent on")

vim.opt.showmatch = true

vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true
vim.g.code_action_menu_window_border = "single"
vim.g.copilot_node_command = "/Users/bigduu/.config/github-copilot/node/bin/node"
