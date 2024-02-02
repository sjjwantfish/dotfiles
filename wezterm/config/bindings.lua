local wezterm = require("wezterm")
local platform = require("utils.platform")()
local act = wezterm.action

local mod = {}

if platform.is_mac then
	-- mod.SUPER = 'SUPER'
	-- mod.SUPER_REV = 'SUPER|CTRL'
	mod.SUPER = "ALT"
	mod.SUPER_REV = "ALT|CTRL"
elseif platform.is_win then
	mod.SUPER = "ALT" -- to not conflict with Windows key shortcuts
	mod.SUPER_REV = "ALT|CTRL"
end

local keys = {
	{ key = "z", mods = mod.SUPER_REV, action = act.TogglePaneZoomState },
	-- paste
	{ key = "v", mods = mod.SUPER, action = act({ PasteFrom = "Clipboard" }) },
	{
		key = "s",
		mods = mod.SUPER,
		action = wezterm.action.QuickSelectArgs({
			patterns = {
				"[\\w/:.,'\"%%%-@_~]+",
			},
		}),
	},
	{
		key = ";",
		mods = mod.SUPER,
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
	-- copy mode
	{
		key = "c",
		mods = mod.SUPER,
		action = act.Multiple({
			act.CopyMode("ClearSelectionMode"),
			act.ActivateCopyMode,
			act.ClearSelection,
		}),
	},
	-- search
	{
		key = "/",
		mods = mod.SUPER,
		action = act.Multiple({ act.ClearSelection, act.Search({ CaseInSensitiveString = "" }) }),
	},
	{
		key = "f",
		mods = mod.SUPER,
		action = act.Multiple({ act.ClearSelection, act.Search({ CaseInSensitiveString = "" }) }),
	},
	{
		key = "F",
		mods = mod.SUPER,
		action = act.Multiple({ act.ClearSelection, act.Search({ CaseSensitiveString = "" }) }),
	},
	-- close pane
	{ key = "w", mods = mod.SUPER, action = act({ CloseCurrentPane = { confirm = true } }) },
	-- Activate Pane
	{ key = "t", mods = mod.SUPER, action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{
		key = "-",
		mods = mod.SUPER,
		action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "\\",
		mods = mod.SUPER,
		action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "LeftArrow", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "RightArrow", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "UpArrow", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Down" }) },
	-- Activate Tab
	{ key = "1", mods = mod.SUPER, action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = mod.SUPER, action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = mod.SUPER, action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = mod.SUPER, action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = mod.SUPER, action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = mod.SUPER, action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = mod.SUPER, action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = mod.SUPER, action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = mod.SUPER, action = act({ ActivateTab = 8 }) },
	-- launcher
	{ key = "r", mods = mod.SUPER, action = wezterm.action.ShowLauncher },
	{ key = "p", mods = mod.SUPER, action = wezterm.action.ActivateCommandPalette },
	{
		key = "`",
		mods = mod.SUPER,
		action = act.RotatePanes("CounterClockwise"),
	},
	-- scroll
	{ key = "e", mods = mod.SUPER, action = act({ ScrollByPage = -1 }) },
	{ key = "q", mods = mod.SUPER, action = act({ ScrollByPage = 1 }) },
	-- rename tab
	{
		key = "R",
		mods = "ALT|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "o",
		mods = mod.SUPER,
		action = wezterm.action_callback(function(window, pane)
			local choices = {}
			for _, name in ipairs(wezterm.mux.get_workspace_names()) do
				table.insert(choices, { label = tostring(name) })
			end
			window:perform_action(
				act.InputSelector({
					action = wezterm.action_callback(function(window, pane, id, label)
						if not id and not label then
							wezterm.log_info("cancelled")
						else
							wezterm.log_info("switch workspace ", id, label)
							window:perform_action(
								act.SwitchToWorkspace({
									name = label,
									spawn = {
										label = "Workspace: " .. label,
										cwd = id,
									},
								}),
								pane
							)
						end
					end),
					title = "Switch workspace",
					choices = choices,
					fuzzy = true,
				}),
				pane
			)
		end),
	},
	{
		key = "i",
		mods = mod.SUPER,
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}
local mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.ExtendSelectionToMouseCursor("Word"),
	},
}

return {
	disable_default_key_bindings = true,
	-- disable_default_mouse_bindings = true,
	-- leader = { key = 'Space', mods = 'ALT|SHIFT' },
	keys = keys,
	mouse_bindings = mouse_bindings,
}
