local wezterm = require("wezterm")

local config = {
	font_size = 18,
	font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" }),
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.9,
	macos_windows_background_blur = 70,

	text_background_opacity = 0.9,
	adjust_window_size_when_change_font_size = false,
	window_padding = {
		left = 2,
		right = 2,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 },
}

config.keys = {
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

return config
