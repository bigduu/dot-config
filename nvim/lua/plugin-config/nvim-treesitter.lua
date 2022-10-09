require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua", "css",
    "go", "java",
    "javascript",
    "json", "kotlin", "scala",
    "rust"

  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  matchup = { enable = true },
  rainbow = { enable = true }
}

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
