{
	wayland.windowManager.hyprland = {
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
  };
}
