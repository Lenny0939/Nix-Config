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
				background-color: rgba(50,50,50,0.9);
				color: white;
			}
			#entry:selected {
				background-color: #bbccdd;
				background: linear-gradient(90deg, #bbccdd, #cca5dd);
				color: #333333;
			}
			#input{
				background-color:rgba(50,50,50,0.5);
				color:white;
				padding: 0.25em;
			}
			#entry{
				padding: 0.25em;
			}
		'';
	};
}
