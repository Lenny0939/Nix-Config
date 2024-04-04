{ config, ... }:
{
	programs.hyprlock = {
		enable = true;
		backgrounds = with config; [
			{
				path = "${stylix.image}";
				color = lib.stylix.colors.base07;
				blur_size = 4;
				blur_passes = 0; # 0 disables blurring
				noise = 0.0117;
				contrast = 1.3000; # Vibrant!!!
				brightness = 0.8000;
				vibrancy = 0.2100;
				vibrancy_darkness = 0.0;
			}
		];
		input-fields = with config.lib.stylix.colors; [
			{
				size = {
					width = 250;
					height = 50;
				};
				outline_thickness = 3;
				dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
				dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
				dots_center = true;
				outer_color = base01;
				inner_color = base00;
				font_color = base07;
				fade_on_empty = true;
				placeholder_text = "<i>Password...</i>"; # Text rendered in the input box when it's empty.
				hide_input = false;
				position = {
					x = 0;
					y = 50;
				}; 
				halign = "center";
				valign = "bottom";
			}
		];

		# Current time
		labels = [
			{
				text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\") </big></b>\"";
				color = config.lib.stylix.colors.base00;
				font_size = 64;
				font_family = "${config.stylix.fonts.monospace.name}";
				position = {
					x = 0;
					y = 16;
				};
				halign = "center";
				valign = "center";
			}
			{
				text = "Hey <span text_transform=\"capitalize\" size=\"larger\">Nerd</span>";
				color = config.lib.stylix.colors.base00;
				font_size = 20;
				font_family = "${config.stylix.fonts.monospace.name}";
				position = {
					x = 0;
					y= 0;
				};
				halign = "center";
				valign = "center";
			}
			{
				text = "Type to unlock!";
				color = config.lib.stylix.colors.base00;
				font_size = 16;
				font_family = "${config.stylix.fonts.monospace.name}";
				position = {
					x= 0;
					y = 30;
				};
				halign = "center";
				valign = "bottom";
			}
		];

		# User label


		# Type to unlock
	};
}
