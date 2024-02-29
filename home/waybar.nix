{config, pkgs, ... }:
let 
	musicCheck = pkgs.pkgs.writeShellScriptBin "musicCheck" /* bash */ ''
		while true
			do
			if [ "$(${pkgs.playerctl}/bin/playerctl --player=%any,firefox status)" = "Playing" ] 
			then
				echo $(${pkgs.playerctl}/bin/playerctl --player=%any,firefox metadata title) by $(${pkgs.playerctl}/bin/playerctl --player=%any,firefox metadata artist) 
			else echo
			fi
			sleep 1
		done
	'';
in
{
	programs.waybar = {
		enable = true;
		style = /* css */ ''
			* {
				border: none;
				border-radius: 0;
				font-family: ${config.font};
				font-size: 16px;
				min-height: 0;
			}
			window#waybar {
			background: transparent;
			color: #${config.colorScheme.palette.base05};
			}
#
		#window {
				font-weight: bold;
		}
		/*
		#workspaces {
				padding: 0 5px;
		}
		*/

		#workspaces button {
				padding: 0 5px;
				background: transparent;
				color: #${config.colorScheme.palette.base05};
				border-top: 2px solid transparent;
		}

		/*#workspaces button.focused {
				color: #c9545d;
				border-top: 2px solid #c9545d;
		}*/

		/*#mode {
				background: #64727D;
				border-bottom: 3px solid white;
		}*/

		#clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-music, #tray, #mode {
				padding: 0 3px;
				margin: 0 2px;
		}

		#clock {
				font-weight: bold;
		}
			/*		@keyframes blink {
				to {
					background-color: #ffffff;
					color: black;
				}
			}
			*/
			#battery.warning:not(.charging) {
				color: #${config.colorScheme.palette.base0B};
				animation-name: blink;
				animation-duration: 0.5s;
				animation-timing-function: linear;
				animation-iteration-count: infinite;
				animation-direction: alternate;
			}
		'';
		settings = [{
			layer = "top";
			position = "top";
			height = 31;
			modules-left = ["hyprland/workspaces" "battery" ];
			modules-center = ["clock" ];
			modules-right = ["custom/music" "pulseaudio" ];
			"hyprland/workspaces" = {
				format = "{name}";
			};
			clock = {
				format = "{:%I:%M %p}";
				format-alt = "{:%d/%m/%y}";
			};
			battery = {
				bat = "BAT0";
				states = {
					warning = 30;
					critical = 15;
				};
				format = "{icon} {capacity}%";
				format-charging = "󰂄 {capacity}%";
				format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
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
			"custom/music" = {
				exec = "${musicCheck}/bin/musicCheck";
				#exec = "echo test";
				format = " {}";
			};
		}];
	};
}
