-- local status, nvim_tree = pcall(require, "nvim-tree")
-- if not status then
--   vim.notify("can not find nvim-tree")
--   return
-- end
local nvim_tree = require("nvim-tree")

nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = true,
  sort_by = "name",
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = "20%",
    adaptive_size = false,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = true,
    number = true,
    relativenumber = true,
    signcolumn = "auto",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
      enable = false,
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    -- icons = {
    --   hint = "h",
    --   info = "i",
    --   warning = "w",
    --   error = "e",
    -- },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = true,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}) -- END_DEFAULT_OPTS

vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
