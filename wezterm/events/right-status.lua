local wezterm = require("wezterm")
local math = require("utils.math")
local M = {}

M.setup = function()
	wezterm.on("update-right-status", function(window, _pane)
		window:set_right_status(wezterm.format({
			{ Attribute = { Underline = "Single" } },
			{ Attribute = { Italic = true } },
			{ Text = wezterm.mux.get_active_workspace() },
		}))
	end)
end

return M
