-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

config.default_prog = { '/usr/bin/fish', '-l' }
config.font = wezterm.font 'Comic Code'
config.font_size = 14
config.color_scheme = "Catppuccin Frappe"
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.5

-- and finally, return the configuration to wezterm
return config
