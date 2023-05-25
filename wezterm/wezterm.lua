local wezterm = require("wezterm")
local act = wezterm.action
-- local wsl_domains = wezterm.default_wsl_domains()
-- for _, dom in ipairs(wsl_domains) do
-- 	dom.default_cwd = "~"
-- 	dom.username = "sujiajun"
-- 	-- dom.default_prog = { "zsh" }
-- end

local default_prog = nil
local launch_menu = nil
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	wezterm.log_info("load windows config")
	local pwsh_prog = { os.getenv("LOCALAPPDATA") .. "\\Microsoft\\WindowsApps\\pwsh.exe" }
	local wsl_arch_prog = { "wsl.exe", "-d", "Arch20230315", "-u", "sujiajun", "--cd", "~" }

	default_prog = pwsh_prog
	launch_menu = {
		{
			label = "Arch20230315",
			args = wsl_arch_prog,
			domain = { DomainName = "wsl" },
		},
		{
			label = "pwsh",
			args = pwsh_prog,
			domain = { DomainName = "local" },
		},
	}
end

local config = {
	color_scheme = "Andromeda",
	window_background_opacity = 0.9,
	disable_default_key_bindings = false,
	default_prog = default_prog,
	launch_menu = launch_menu,
	keys = {
		-- paste
		{ key = "v", mods = "ALT", action = act({ PasteFrom = "Clipboard" }) },
		{ key = "v", mods = "WIN", action = act({ PasteFrom = "Clipboard" }) },
		-- quick select mode
		{ key = "s", mods = "ALT", action = wezterm.action.QuickSelect },
		-- copy mode
		{
			key = "c",
			mods = "ALT",
			action = act.Multiple({ act.CopyMode("ClearSelectionMode"), act.ActivateCopyMode, act.ClearSelection }),
		},
		-- search
		{
			key = "/",
			mods = "ALT",
			action = act.Multiple({ act.ClearSelection, act.Search({ CaseSensitiveString = "" }) }),
		},
		-- close pane
		{ key = "w", mods = "ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
		-- Activate Pane
		{ key = "t", mods = "SUPER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "t", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "-", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "\\", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "LeftArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "RightArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "UpArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) },
		-- Activate Tab
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
		{ key = "r", mods = "ALT", action = wezterm.action.ShowLauncher },
		{ key = "p", mods = "ALT", action = wezterm.action.ActivateCommandPalette },
		{
			key = "`",
			mods = "ALT",
			action = act.RotatePanes("CounterClockwise"),
		},
		-- scroll
		{ key = "b", mods = "ALT", action = act({ ScrollByPage = -1 }) },
		{ key = "f", mods = "ALT", action = act({ ScrollByPage = 1 }) },
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = "OpenLinkAtMouseCursor",
		},
	},
}

return config
