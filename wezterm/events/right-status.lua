local wezterm = require("wezterm")
local M = {}

M.setup = function()
	wezterm.on("update-right-status", function(window, _pane)
		window:set_right_status(wezterm.format({
			{ Background = { Color = "#11111b" } },
			{ Foreground = { Color = "#bda0f1" } },
			{ Attribute = { Intensity = "Bold" } },
			{ Text = "" },
			{ Background = { Color = "#bda0f1" } },
			{ Foreground = { Color = "#11111b" } },
			{ Attribute = { Italic = true } },
			{ Text = string.format(" %s ", wezterm.mux.get_active_workspace()) },
		}))
	end)
end

return M
