local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }
end
config.color_scheme = "Catppuccin Mocha"

return config
