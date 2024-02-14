{ pkgs, ... }: 
{
	systemd = {
		timers."homework-timer" = {
			wantedBy = [ "timers.target" ];
			timerConfig = {
				OnCalendar = [ "daily" "*-*-* 15:30:00" ];
				Persistent = true;
				Unit = "homework-notify";
			};
		};
		services."homework-notify" = {
			script = ''
				${pkgs.libnotify}/bin/notify-send "HOMEWORK" "$(${pkgs.coreutils}/bin/cat /home/lenny/School/TODO.md)"
			'';
			serviceConfig = {
				User = "lenny";
				Environment = "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/%U/bus";
			};
		};
	};
}
