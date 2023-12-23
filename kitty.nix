{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		settings = { 
			confirm_os_window_close = 0;
			background_opacity = "0.7"; 
		};
		theme = "Tokyo Night";
		font = {
			name = "Hack Nerd Font";
			size = 11;
		};
		shellIntegration.enableZshIntegration = true;
	};
}

