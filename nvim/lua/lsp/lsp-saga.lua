local keymap = vim.keymap.set
local saga = require("lspsaga")
saga.init_lsp_saga({
  border_style = "rounded",
  code_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
})
-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
