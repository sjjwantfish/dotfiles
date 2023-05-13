local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config = {
	-- color_scheme = "Batman",
	color_scheme = "One Dark (Gogh)",
	window_background_opacity = 0.9,
	keys = {
		{
			key = "c",
			mods = "ALT",
			action = act.Multiple({ act.CopyMode("ClearSelectionMode"), act.ActivateCopyMode, act.ClearSelection }),
		},
		-- { key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "w", mods = "ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
		-- Activate Pane
		{ key = "t", mods = "SUPER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "-", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "\\", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "h", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "k", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) },
		-- Activate Tab
		{ key = "h", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
		{ key = "l", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
		{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
		-- launcher
		{ key = "a", mods = "ALT", action = wezterm.action.ShowLauncher },
		{ key = "p", mods = "ALT", action = wezterm.action.ActivateCommandPalette },
		-- {
		-- 	key = "`",
		-- 	mods = "ALT",
		-- 	action = act.RotatePanes("CounterClockwise"),
		-- },
	},
}

return config
