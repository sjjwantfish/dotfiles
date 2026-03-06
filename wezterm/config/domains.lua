return {
	-- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
	ssh_domains = {},

	-- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
	unix_domains = {},

	-- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
	wsl_domains = {
		{
			name = "WSL:Arch",
			distribution = "Arch",
			username = "sjjwantfish",
			default_cwd = "/home/sjjwantfish",
			default_prog = { "zsh" },
		},
	},
}
