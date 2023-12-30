{ config, pkgs, ... }:
{
	programs.wofi = {
		enable = true;
		settings = {
			insensitive= true;
			allow_images = true;
			mode = "drun";
		};
		style = ''
			* {
				border-radius: 5px;
			}
			window {
				font-size: 28px;
				font-family: "Hack Nerd Font";
				background-color: #${config.colorScheme.colors.base00};
				color: #${config.colorScheme.colors.base05};
			}
			#entry:selected {
				background: linear-gradient(90deg, #${config.colorScheme.colors.base05}, #${config.colorScheme.colors.base07});
			}
			#text:selected {
				color: #${config.colorScheme.colors.base01};
			}
			#input{
				background-color: #${config.colorScheme.colors.base00};
				color: #${config.colorScheme.colors.base05};
				padding: 0.25em;
			}
			#entry{
				padding: 0.25em;
			}
		'';
	};
}
