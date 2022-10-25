local keymap = vim.keymap.set
local saga = require("lspsaga")
saga.init_lsp_saga({
  border_style = "rounded",
  code_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  -- show outline
  show_outline = {
    win_position = "right",
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = "",
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = "┃",
    jump_key = "o",
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  definition_action_keys = {
    edit = "o",
    vsplit = "<C-i>v",
    split = "<C-i>i",
    tabe = "<C-i>t",
    quit = "<C-c>",
  },
})
-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
