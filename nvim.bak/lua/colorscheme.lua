-- require("github-theme").setup({
--   theme_style = "dark_default",
--   function_style = "italic",
--   sidebars = { "qf", "vista_kind", "terminal", "packer" },
--
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   colors = { hint = "orange", error = "#ff0000" },
--
--   -- Overwrite the highlight groups
--   overrides = function(c)
--     return {
--       -- htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
--       DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
--       -- this will remove the highlight groups
--       -- TSField = {},
--     }
--   end,
--   -- 透明背景
--   transparent = true,
--   -- dark floating background
--   dark_float = true,
-- })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "night", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  day_brightness = 0.5, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not find")
  return
end
