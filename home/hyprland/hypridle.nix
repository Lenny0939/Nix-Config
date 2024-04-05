{ pkgs, ... }:
{
	config.services.hypridle = {
		enable = true;
		lockCmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
		beforeSleepCmd = "loginctl lock-session";
		afterSleepCmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
		listeners = with pkgs; [
			{
				timeout = 150;
				onTimeout = "${brightnessctl}/bin/brightnessctl -s set 10";
				onResume = "${brightnessctl}/bin/brightnessctl -r";
			}
			{
				timeout = 300;
				onTimeout = "loginctl lock-session";
			}
			{
				timeout = 330;
				onTimeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
				onResume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
			}
			{
				timeout = 900;
				onTimeout = "systemctl suspend";
			}
		];
	};
}
