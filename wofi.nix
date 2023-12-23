{ config, pkgs, ... }:
{
	programs.wofi = {
		enable = true;
		settings = {
			insensitive= true;
			allow_images = true;
		};
		style = ''
			window {
				font-size: 28px;
				font-family: "Hack Nerd Font";
				background-color: rgba(50,50,50,0.9);
				color: white;
			}
			#entry:selected {
				background-color: #bbccdd;
				color: #333333;
			}
		'';
	};
}
