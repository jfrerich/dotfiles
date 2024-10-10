local wezterm = require("wezterm")
local config = {}
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }
end
config.color_scheme = "Catppuccin Mocha"
config.audible_bell = "Disabled"

return config
