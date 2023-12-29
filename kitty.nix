{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		settings = { 
			confirm_os_window_close = 0;
			background_opacity = "0.9"; 
			background = "#${config.colorScheme.colors.base00}";
			foreground = "#${config.colorScheme.colors.base05}";
			selection_background = "#${config.colorScheme.colors.base05}";
			selection_foregorund = "#${config.colorScheme.colors.base00}";
			url_color = "#${config.colorScheme.colors.base04}";
			cursor = "#${config.colorScheme.colors.base05}";
			active_border_color = "#${config.colorScheme.colors.base03}";
			inactive_border_color = "#${config.colorScheme.colors.base01}";
			active_tab_background = "#${config.colorScheme.colors.base00}";
			active_tab_foreground = "#${config.colorScheme.colors.base05}";
			inactive_tab_background = "#${config.colorScheme.colors.base01}";
			inactive_tab_foreground = "#${config.colorScheme.colors.base04}";
			tab_bar_background = "#${config.colorScheme.colors.base01}";
			color0 = "#${config.colorScheme.colors.base00}";
			color1 = "#${config.colorScheme.colors.base08}";
			color2 = "#${config.colorScheme.colors.base0B}";
			color3 = "#${config.colorScheme.colors.base0A}";
			color4 = "#${config.colorScheme.colors.base0D}";
			color5 = "#${config.colorScheme.colors.base0E}";
			color6 = "#${config.colorScheme.colors.base0C}";
			color7 = "#${config.colorScheme.colors.base05}";
			color8 = "#${config.colorScheme.colors.base03}";
			color9 = "#${config.colorScheme.colors.base09}";
			color10 = "#${config.colorScheme.colors.base01}";
			color11 = "#${config.colorScheme.colors.base02}";
			color12 = "#${config.colorScheme.colors.base04}";
			color13 = "#${config.colorScheme.colors.base06}";
			color14 = "#${config.colorScheme.colors.base0F}";
			color15 = "#${config.colorScheme.colors.base07}";
			#colorscheme = "tokyo_night_storm";
		};
		font = {
			name = "Hack Nerd Font";
			size = 11;
		};
		shellIntegration.enableZshIntegration = true;
	};
}

