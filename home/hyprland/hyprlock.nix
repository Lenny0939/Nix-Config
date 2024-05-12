{ config, ... }:
{
	programs.hyprlock = {
		enable = true;
		settings = {
			background = with config; [
				{
					path = "${stylix.image}";
				}
			];
			general = {
				no_fade_in = true;
				no_fade_out = true;
				hide_cursor = true;
				disable_loading_bar = true;
				ignore_empty_input = true;
			};
			input-field = with config.lib.stylix.colors; [
				{
					size = "250, 50";
					outline_thickness = 3;
					dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
					dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
					dots_center = true;
					fade_on_empty = true;
					hide_input = false;
					position = "0, 80";
					halign = "center";
					valign = "bottom";
				}
			];

			# Current time
			label = [
			{
				text = "$TIME";
				font_size = 64;
				font_family = "${config.stylix.fonts.monospace.name}";
				position = "0, 50";
				halign = "center";
				valign = "center";
			}
			{
				text = "Hey <span size=\"larger\">Nerd</span>";
				font_size = 20;
				font_family = "${config.stylix.fonts.monospace.name}";
				position = "0, -20";
				halign = "center";
				valign = "center";
			}
			];
		};
	};
}
