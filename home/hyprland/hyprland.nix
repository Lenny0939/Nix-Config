{ config, pkgs, ... }:
let
	startup = with pkgs; writeShellScriptBin "startup" /* bash */ ''
		${eww}/bin/eww open bar
		${easyeffects}/bin/easyeffects --gapplication-service
	'';
in
{   
	imports = [
		./hyprlock.nix
		../../modules/blur.nix
	];
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [ "${config.stylix.image}" ];
			wallpaper = [ ",${config.stylix.image}" ];
			splash = false;
			ipc = true;
		};
	};
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		settings = {
			exec-once = "${startup}/bin/startup";
			xwayland.force_zero_scaling = true;
			misc.disable_hyprland_logo = true;
			input = {
				follow_mouse = 1;
				touchpad = {
					natural_scroll = "yes";
					disable_while_typing = false;
				};
			};
			general = {
				gaps_in = 5;
				gaps_out = 0;
				border_size = 0;
				layout = "dwindle";
			};

			animation = [ 
				"global,1,5,default" 
				"workspaces,1,5,default,slidevert"
				"windows,1,5,default,slide"
			];
			decoration.blur = {
				enabled = config.blur;
			};
			dwindle = {
				pseudotile = "yes";
				preserve_split = "yes";
				no_gaps_when_only = 1;
			};
			gestures = {
				workspace_swipe = "on";
			};
			"$mainMod" = "ALT";

			bind = [
				", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
				#"CAPS, Caps_Lock, exec, notify-send working"
				"$mainMod, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m output --clipboard-only"
				"$mainMod, F, exec, ${pkgs.kitty}/bin/kitty"
				"$mainMod, D, exec, ${pkgs.kitty}/bin/kitty --hold ${pkgs.fzf}/bin/fzf --bind 'enter:become($EDITOR {})'"
				"$mainMod, Z, killactive,"
				"$mainMod, V, togglefloating"
				"$mainMod, S, exec, ${pkgs.wofi}/bin/wofi"
				"$mainMod, H, togglesplit,"
				"$mainMod, A, fullscreen"
				"$mainMod, M, exec, ${pkgs.hyprlock}/bin/hyprlock"
				", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set -e +5%"
				", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set -e 5%-"
				", XF86AudioRaiseVolume, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +10%"
				", XF86AudioLowerVolume, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -10%"
				", XF86AudioMute, exec, ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"
				", XF86AudioMicMute, exec, ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle"

				# Move focus with mainMod + arrow keys
				"$mainMod, h, movefocus, l"
				"$mainMod, j, movefocus, d"
				"$mainMod, k, movefocus, u"
				"$mainMod, l, movefocus, r"
		
				# Resize windows with mainMod + SUPER + arrow keys
				"$mainMod SUPER, h, resizeactive, -25 0"
				"$mainMod SUPER, j, resizeactive, 0 25"
				"$mainMod SUPER, k, resizeactive, 0 -25"
				"$mainMod SUPER, l, resizeactive, 25 0"

				# Move windows with mainMod + shift + arrow keys
				"$mainMod SHIFT, h, movewindow, l"
				"$mainMod SHIFT, j, movewindow, d"
				"$mainMod SHIFT, k, movewindow, u"
				"$mainMod SHIFT, l, movewindow, r"

				# Switch workspaces with mainMod + [0-9]
				"$mainMod, q, workspace, 1"
				"$mainMod, w, workspace, 2"
				"$mainMod, e, workspace, 3"
				"$mainMod, r, workspace, 4"
				"$mainMod, t, workspace, 5"
				"$mainMod, y, workspace, 6"
				"$mainMod, u, workspace, 7"
				"$mainMod, i, workspace, 8"
				"$mainMod, o, workspace, 9"
				"$mainMod, p, workspace, 10"

				# Move active window to a workspace with mainMod + SHIFT + [0-9]
				"$mainMod SHIFT, q, movetoworkspace, 1"
				"$mainMod SHIFT, w, movetoworkspace, 2"
				"$mainMod SHIFT, e, movetoworkspace, 3"
				"$mainMod SHIFT, r, movetoworkspace, 4"
				"$mainMod SHIFT, t, movetoworkspace, 5"
				"$mainMod SHIFT, y, movetoworkspace, 6"
				"$mainMod SHIFT, u, movetoworkspace, 7"
				"$mainMod SHIFT, i, movetoworkspace, 8"
				"$mainMod SHIFT, o, movetoworkspace, 9"
				"$mainMod SHIFT, p, movetoworkspace, 10"

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
