-- require("github-theme").setup({
--   theme_style = "dark_default",
--   function_style = "NONE",
--   sidebars = { "qf", "vista_kind", "terminal", "packer" },
--
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   colors = { hint = "orange", error = "#ff0000" },
--
--   -- Overwrite the highlight groups
--   -- overrides = function(c)
--   --   return {
--   --     -- htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
--   --     DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
--   --     -- this will remove the highlight groups
--   --     -- TSField = {},
--   --   }
--   -- end,
--   -- 透明背景
--   transparent = true,
--   -- dark floating background
--   dark_float = true,
-- })

local colorscheme = "tokyonight-night"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not find")
  return
end
