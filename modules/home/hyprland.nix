{ config, pkgs, ... }:
let
	startup = pkgs.pkgs.writeShellScriptBin "startup" /* sh */ ''
		${pkgs.hyprland}/bin/hyprctl setcursor Bibata-Modern-Ice 25 
		${pkgs.swww}/bin/swww init
		${pkgs.waybar}/bin/waybar
	'';
in
{   
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		settings = {
			#monitor = "preferred,auto,auto";
			exec-once = "${startup}/bin/startup";
			input = {
				kb_layout = "us,us";
				kb_variant = "colemak,"; 
				kb_options = "grp:ctrl_alt_toggle, shift:both_capslock_cancel";
				follow_mouse = 1;
				touchpad = {
					natural_scroll = "yes";
				};
			};
			general = with config.colorScheme.colors; {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 1;
				"col.active_border" = "rgba(${base05}ff)"; 
				"col.inactive_border" = "rgba(${base00}ff)"; 
				layout = "dwindle";
			};

			decoration = with config.colorScheme.colors; {
				rounding = 7;
				drop_shadow = "yes";
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(${base01}ee)";
				/*
				blur = {
					enabled = true;
					size = 20;
					passes = 1;
					noise = 0.01;
					contrast = 1;
					brightness = 1;
				};
				*/
			};
			animations = {
				enabled = "yes";
				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 7, myBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border,  1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];
			};
			dwindle = {
				pseudotile = "yes";
				preserve_split = "yes";
				no_gaps_when_only = 1;
			};
			master = {
				new_is_master = true;
			};
			gestures = {
				workspace_swipe = "on";
			};
			"$mainMod" = "ALT";

			bind = [
				", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
				"$mainMod, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m output --clipboard-only"
				"$mainMod, T, exec, ${pkgs.kitty}/bin/kitty"
				"$mainMod, Z, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, V, togglefloating"
				"$mainMod, R, exec, ${pkgs.wofi}/bin/wofi"
				"$mainMod, H, togglesplit,"
				"$mainMod, B, exec, ${pkgs.firefox}/bin/firefox"
				"$mainMod, A, fullscreen"
				#"$mainMod, C, exec, rofi -show calculator
				#"$mainMod, semicolon, exec, rofi -show power-menu -modi power-menu:/home/lenny/.local/bin/rofi-power-menu
				#"$mainMod, K, exec, ~/.local/bin/rofi-wifi-menu.sh
				", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set -e +5%"
				", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set -e 5%-"
				", XF86AudioRaiseVolume, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +10%"
				", XF86AudioLowerVolume, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -10%"
				", XF86AudioMute, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"
				", XF86AudioMicMute, exec, ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle"

				# Move focus with mainMod + arrow keys
				"$mainMod, n, movefocus, l"
				"$mainMod, o, movefocus, r"
				"$mainMod, i, movefocus, u"
				"$mainMod, e, movefocus, d"
		
				# Resize windows with mainMod + SUPER + arrow keys
				"$mainMod SUPER, o, resizeactive, 25 0"
				"$mainMod SUPER, n, resizeactive, -25 0"
				"$mainMod SUPER, i, resizeactive, 0 -25"
				"$mainMod SUPER, e, resizeactive, 0 25"

				# Move windows with mainMod + shift + arrow keys
				"$mainMod SHIFT, n, movewindow, l"
				"$mainMod SHIFT, o, movewindow, r"
				"$mainMod SHIFT, i, movewindow, u"
				"$mainMod SHIFT, e, movewindow, d"

				# Switch workspaces with mainMod + [0-9]
				"$mainMod, q, workspace, 1"
				"$mainMod, w, workspace, 2"
				"$mainMod, f, workspace, 3"
				"$mainMod, p, workspace, 4"
				"$mainMod, g, workspace, 5"
				"$mainMod, j, workspace, 6"
				"$mainMod, l, workspace, 7"
				"$mainMod, u, workspace, 8"
				"$mainMod, y, workspace, 9"
				"$mainMod, semicolon, workspace, 10"

				# Move active window to a workspace with mainMod + SHIFT + [0-9]
				"$mainMod SHIFT, q, movetoworkspace, 1"
				"$mainMod SHIFT, w, movetoworkspace, 2"
				"$mainMod SHIFT, f, movetoworkspace, 3"
				"$mainMod SHIFT, p, movetoworkspace, 4"
				"$mainMod SHIFT, g, movetoworkspace, 5"
				"$mainMod SHIFT, j, movetoworkspace, 6"
				"$mainMod SHIFT, l, movetoworkspace, 7"
				"$mainMod SHIFT, u, movetoworkspace, 8"
				"$mainMod SHIFT, y, movetoworkspace, 9"
				"$mainMod SHIFT, semicolon, movetoworkspace, 10"

				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];

			# Move/resize windows with mainMod + LMB/RMB and dragging
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
				"$mainMod SHIFT, mouse:272, resizewindow"
			];
		};
  };
}
