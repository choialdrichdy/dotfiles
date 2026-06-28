local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
-- config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- config.automatically_reload_config = true
-- config.window_decorations = "RESIZE"
-- config.adjust_window_size_when_changing_font_size = false

return config
