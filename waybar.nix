{config, pkgs, ... }:
{
	programs.waybar = {
		enable = true;
		style = ''
			* {
				border: none;
				border-radius: 0;
				font-family: "Hack Nerd Font";
				font-size: 16px;
				min-height: 0;
			}
			window#waybar {
			background: transparent;
			color: white;
			}

		#window {
				font-weight: bold;
				font-family: "Hack";
		}
		/*
		#workspaces {
				padding: 0 5px;
		}
		*/

		#workspaces button {
				padding: 0 5px;
				background: transparent;
				color: white;
				border-top: 2px solid transparent;
		}

		#workspaces button.focused {
				color: #c9545d;
				border-top: 2px solid #c9545d;
		}

		#mode {
				background: #64727D;
				border-bottom: 3px solid white;
		}

		#clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
				padding: 0 3px;
				margin: 0 2px;
		}

		#clock {
				font-weight: bold;
		}

		#battery {
		}

		#battery icon {
				color: red;
		}

		#battery.charging {
		}

		@keyframes blink {
				to {
						background-color: #ffffff;
						color: black;
				}
		}

		#battery.warning:not(.charging) {
				color: white;
				animation-name: blink;
				animation-duration: 0.5s;
				animation-timing-function: linear;
				animation-iteration-count: infinite;
				animation-direction: alternate;
		}

		#cpu {
		}

		#memory {
		}

		#network {
	}

	#network.disconnected {
			background: #f53c3c;
	}

	#pulseaudio {
	}

	#pulseaudio.muted {
	}

	#custom-spotify {
			color: rgb(102, 220, 105);
	}

	#tray {

	} 
		'';
		settings = [{
			layer = "top";
			position = "top";
			height = 30;
			modules-left = ["hyprland/workspaces" "clock"];
			modules-center = ["hyprland/window" "custom/spotify"];
			modules-right = ["pulseaudio" "battery" ];
			"hyprland/workspaces" = {
				format = "{name}";
			};
			clock = {
				format-alt = "{:%Y-%m-%d}";
			};
			battery = {
				bat = "BAT0";
				states = {
					warning = 30;
					critical = 15;
				};
				format = "{icon} {capacity}%";
				format-icons = ["" "" "" "" ""];
			};
			pulseaudio = {
				format = "{icon} {volume}%";
				format-bluetooth = "{volume}% {icon}";
				format-muted = "";
				format-icons = {
					headphones = "󰋋";
					default = ["" ""];
				};
			};
			"custom/spotify" = {
				exec = echo "$(${pkgs.playerctl} -p spotifyd metadata artist) - $(${pkgs.playerctl} -p spotifyd metadata title)";
				format = "{} ";
				return-type = "json";
			};
		}];
	};
}
