{
	/*wayland.windowManager.hyprland = {
		enable = true;
		systemdIntegration = true;
		extraConfig = ''
			monitor=,preferred,auto,auto
			exec-once = waybar && swww init && hyprctl setcursor Bibata-Modern-Ice 25
			exec-once = hyprctl setcursor Bibata-Modern-Ice 25   
			input {
				kb_layout = us,us
				kb_variant = colemak, 
				# kb_options = grp:alt_shift_toggle, shift:both_capslock_cancel
				kb_options = shift:both_capslock_cancel
				follow_mouse = 1
				touchpad {
					natural_scroll = yes
				}
			}
			general {
				gaps_in = 5
				gaps_out = 20
				border_size = 1
				col.active_border = rgba(573729aa) rgba(574729aa) 45deg
				col.inactive_border = rgba(595959aa)

				layout= dwindle
			}

			decoration {
				rounding = 7
				drop_shadow = yes
				shadow_range = 4
				shadow_render_power = 3
				col.shadow = rgba(1a1a1aee)
				blur {
					enabled = true;
					size = 20;
					passes = 1;
					noise = 0.01;
					contrast = 1;
					brightness = 1;
				}
			}

			animations {
				enabled = yes
				bezier = myBezier, 0.05, 0.9, 0.1, 1.05
				animation = windows, 1, 7, myBezier
				animation = windowsOut, 1, 7, default, popin 80%
				animation = border,  1, 10, default
				animation = borderangle, 1, 8, default
				animation = fade, 1, 7, default
				animation = workspaces, 1, 6, default
			}
			dwindle {
				pseudotile = yes
				preserve_split = yes
			}
			master {
				new_is_master = true
			}
			
			gestures {
				workspace_swipe = on
			}


			$mainMod = ALT
			bind =, PRINT, exec, grim -g "$(slurp -d)" - | swappy -f -
			bind = $mainMod, T, exec, kitty
			bind = $mainMod, Q, killactive,
			bind = $mainMod, M, exit,
			bind = $mainMod, V, togglefloating
			bind = $mainMod, R, exec, rofi -show drun
			bind = $mainMod, P, pseudo,
			bind = $mainMod, J, togglesplit,
			bind = $mainMod, B, exec, firefox
			bind = $mainMod, F, fullscreen
			#bind = $mainMod, C, exec, rofi -show calculator
			#bind = $mainMod, semicolon, exec, rofi -show power-menu -modi power-menu:/home/lenny/.local/bin/rofi-power-menu
			#bind = $mainMod, K, exec, ~/.local/bin/rofi-wifi-menu.sh
			bind =, XF86MonBrightnessUp, exec, brightnessctl set -e +5%
			bind =, XF86MonBrightnessDown, exec, brightnessctl set -e 5%-
			bind =, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +10%
			bind =, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -10%
			bind =, XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
			bind =, XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle

			# Move focus with mainMod + arrow keys
			bind = $mainMod, n, movefocus, l
			bind = $mainMod, o, movefocus, r
			bind = $mainMod, i, movefocus, u
			bind = $mainMod, e, movefocus, d
			
			# Resize windows with mainMod + shift + arrow keys
			bind = $mainMod SHIFT, a, n, resizewindow, l
			bind = $mainMod SHIFT, a, o, resizewindow, r
			bind = $mainMod SHIFT, a, i, resizewindow, u
			bind = $mainMod SHIFT, a, e, resizewindow, d

			# Move windows with mainMod + shift + arrow keys
			bind = $mainMod SHIFT, n, movewindow, l
			bind = $mainMod SHIFT, o, movewindow, r
			bind = $mainMod SHIFT, i, movewindow, u
			bind = $mainMod SHIFT, e, movewindow, d

			# Switch workspaces with mainMod + [0-9]
			bind = $mainMod, 1, workspace, 1
			bind = $mainMod, 2, workspace, 2
			bind = $mainMod, 3, workspace, 3
			bind = $mainMod, 4, workspace, 4
			bind = $mainMod, 5, workspace, 5
			bind = $mainMod, 6, workspace, 6
			bind = $mainMod, 7, workspace, 7
			bind = $mainMod, 8, workspace, 8
			bind = $mainMod, 9, workspace, 9
			bind = $mainMod, 0, workspace, 10

			# Move active window to a workspace with mainMod + SHIFT + [0-9]
			bind = $mainMod SHIFT, 1, movetoworkspace, 1
			bind = $mainMod SHIFT, 2, movetoworkspace, 2
			bind = $mainMod SHIFT, 3, movetoworkspace, 3
			bind = $mainMod SHIFT, 4, movetoworkspace, 4
			bind = $mainMod SHIFT, 5, movetoworkspace, 5
			bind = $mainMod SHIFT, 6, movetoworkspace, 6
			bind = $mainMod SHIFT, 7, movetoworkspace, 7
			bind = $mainMod SHIFT, 8, movetoworkspace, 8
			bind = $mainMod SHIFT, 9, movetoworkspace, 9
			bind = $mainMod SHIFT, 0, movetoworkspace, 10

			# Scroll through existing workspaces with mainMod + scroll
			bind = $mainMod, mouse_down, workspace, e+1
			bind = $mainMod, mouse_up, workspace, e-1

			# Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    '';
  };*/
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
			modules-center = ["hyprland/window"];
			modules-right = ["pulseaudio" "battery"];
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
		}];
		/*configSource = ''		
			"layer": "top", // Waybar at top layer
				"position": "top", // Waybar at the bottom of your screen
				"height": 24, // Waybar height
				// "width": 1366, // Waybar width
				// Choose the order of the modules
				"modules-left": ["hyprland/workspaces", "clock"],
				"modules-center": ["hyprland/window"],
				"modules-right": ["pulseaudio", "battery"],
				"hyprland/workspaces": {
					"disable-scroll": true,
					"format": "{name}",
				},
				"clock": {
					"format-alt": "{:%Y-%m-%d}"
				},
				"battery": {
					"bat": "BAT0",
					"states": {
						// "good": 95,
						"warning": 30,
						"critical": 15
					},
				"format": "{icon} {capacity}%",
					// "format-good": "", // An empty format will hide the module
					// "format-full": "",
					"format-icons": ["", "", "", "", ""]
				},
				"pulseaudio": {
					//"scroll-step": 1,
					"format": "{icon} {volume}%",
					"format-bluetooth": "{volume}% {icon}",
					"format-muted": "",
					"format-icons": {
						"headphones": "",
						"handsfree": "",
						"headset": "",
						"phone": "",
						"portable": "",
						"car": "",
						"default": ["", ""]
					},
					"on-click": "pavucontrol"
				},
				/*"tray": {
					// "icon-size": 21,
					"spacing": 10
				},
				"cpu": {
					"format": "{usage}% "
				},
				"memory": {
					"format": "{}% "
				},	
				"network": {
					// "interface": "wlp2s0", // (Optional) To force the use of this interface
					"format-wifi": "{essid} ({signalStrength}%) ",
					"format-ethernet": "{ifname}: {ipaddr}/{cidr} ",
					"format-disconnected": "Disconnected ⚠"
				},
				"custom/spotify": {
					"format": " {}",
					"max-length": 40,
					"interval": 30, // Remove this if your script is endless and write in loop
					"exec": "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null", // Script in resources folder
					"exec-if": "pgrep spotify"
				}
		'';
		*/
	};
}
