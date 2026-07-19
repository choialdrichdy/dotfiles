local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()
local is_macos = wezterm.target_triple:find("darwin") ~= nil

local ESC = "\027"
local CTRL_A = "\001"
local CTRL_E = "\005"
local CTRL_K = "\011"
local CTRL_U = "\025"
local CTRL_W = "\023"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.color_scheme = "Gruvbox Dark (Gogh)"
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }

config.keys = {
	-- iTerm2-style natural text editing.
	-- These send readline/zle-compatible editing commands, which work in zsh,
	-- bash, and most terminal prompts across macOS and Linux.
	{ key = "LeftArrow", mods = "ALT", action = act.SendString(ESC .. "b") },
	{ key = "RightArrow", mods = "ALT", action = act.SendString(ESC .. "f") },
	{ key = "Backspace", mods = "ALT", action = act.SendString(CTRL_W) },
	{ key = "phys:Delete", mods = "ALT", action = act.SendString(ESC .. "d") },

	{ key = "LeftArrow", mods = "SUPER", action = act.SendString(CTRL_A) },
	{ key = "RightArrow", mods = "SUPER", action = act.SendString(CTRL_E) },
	{ key = "Backspace", mods = "SUPER", action = act.SendString(CTRL_U) },
	{ key = "phys:Delete", mods = "SUPER", action = act.SendString(CTRL_K) },
}

if not is_macos then
	-- Linux and Windows convention: Ctrl+Left/Right move by word.
	-- zsh does not bind the raw xterm Ctrl-arrow sequences by default, so send
	-- the portable readline/zle Meta-b and Meta-f sequences instead.
	table.insert(config.keys, { key = "LeftArrow", mods = "CTRL", action = act.SendString(ESC .. "b") })
	table.insert(config.keys, { key = "RightArrow", mods = "CTRL", action = act.SendString(ESC .. "f") })
end

-- config.automatically_reload_config = true
-- config.window_decorations = "RESIZE"
-- config.adjust_window_size_when_changing_font_size = false

return config
