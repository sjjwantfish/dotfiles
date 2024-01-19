-- local wezterm = require("wezterm")
-- config = {
-- 	font_size = 16,
-- 	color_scheme = "Catppuccin Mocha",
-- 	use_fancy_tab_bar = false,
-- 	show_new_tab_button_in_tab_bar = false,
-- 	window_background_opacity = 0.9,
-- 	-- macos_window_background_blur = 70,
-- 	adjust_window_size_when_changing_font_size = false,
-- }

-- return config
local Config = require("config")

require("events.right-status").setup()
require("events.tab-title").setup()
require("events.new-tab-button").setup()

return Config:init()
	:append(require("config.appearance"))
	:append(require("config.bindings"))
	:append(require("config.domains"))
	:append(require("config.fonts"))
	:append(require("config.general"))
	:append(require("config.launch")).options
