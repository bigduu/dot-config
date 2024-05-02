local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 23
-- font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" }),
config.font = wezterm.font("Hack Nerd Font Mono")
config.color_scheme = "Vs Code Dark+ (Gogh)"
config.audible_bell = "Disabled"

config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false

config.window_background_opacity = 0.5
config.macos_window_background_blur = 5
config.text_background_opacity = 0.6
config.skip_close_confirmation_for_processes_named = { "flatpak-spawn" }
config.window_close_confirmation = "NeverPrompt"

-- config.adjust_window_size_when_change_font_size = false

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
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
	{
		key = "b",
		mods = "LEADER",
		action = wezterm.action.ScrollByPage(-1),
	},
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action.ScrollByPage(1),
	},
}
local act = wezterm.action
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-3),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(3),
	},
}

return config
