-- local colors = require("colors.custom")
-- local fonts = require('config.fonts')

return {
	color_scheme = "Catppuccin Mocha",
	-- term = 'xterm-256color',
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	-- scrollbar
	enable_scroll_bar = true,
	min_scroll_bar_height = "3cell",

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = true,
	tab_max_width = 50,
	show_tab_index_in_tab_bar = true,
	switch_to_last_active_tab_when_closing_tab = true,

	-- cursor
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 700,

	-- window
	-- window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	-- window_decorations = "RESIZE",
	window_close_confirmation = "AlwaysPrompt",
	window_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,
}
