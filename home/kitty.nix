{ config, ... }:
{
	imports = [
		../modules/fonts.nix
	];
	programs.kitty = {
		enable = true;
		settings = { 
			confirm_os_window_close = 0;
			background_opacity = "0.0"; 
			background = "#${config.colorScheme.palette.base00}";
			foreground = "#${config.colorScheme.palette.base05}";
			selection_background = "#${config.colorScheme.palette.base05}";
			selection_foreground = "#${config.colorScheme.palette.base00}";
			url_color = "#${config.colorScheme.palette.base04}";
			cursor = "#${config.colorScheme.palette.base05}";
			color0 = "#${config.colorScheme.palette.base00}";
			color1 = "#${config.colorScheme.palette.base08}";
			color2 = "#${config.colorScheme.palette.base0B}";
			color3 = "#${config.colorScheme.palette.base0A}";
			color4 = "#${config.colorScheme.palette.base0D}";
			color5 = "#${config.colorScheme.palette.base0E}";
			color6 = "#${config.colorScheme.palette.base0C}";
			color7 = "#${config.colorScheme.palette.base05}";
			color8 = "#${config.colorScheme.palette.base03}";
			color9 = "#${config.colorScheme.palette.base09}";
			color10 = "#${config.colorScheme.palette.base01}";
			color11 = "#${config.colorScheme.palette.base02}";
			color12 = "#${config.colorScheme.palette.base04}";
			color13 = "#${config.colorScheme.palette.base06}";
			color14 = "#${config.colorScheme.palette.base0F}";
			color15 = "#${config.colorScheme.palette.base07}";
		};
		font = {
			name = config.font;
		};
		shellIntegration.enableZshIntegration = true;
	};
}

