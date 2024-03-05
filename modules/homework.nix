{ pkgs, ... }: 
{
	systemd = {
		user = {
			timers."homework-timer" = {
				wantedBy = [ "timers.target" ];
				timerConfig = {
					OnCalendar = [ "daily" "*-*-* 15:30:00" ];
					Persistent = true;
					Unit = "homework-notify.service";
				};
			};
			services."homework-notify" = {
				script = ''
					${pkgs.libnotify}/bin/notify-send "Homework" "$(${pkgs.coreutils}/bin/cat /home/lenny/nix/homework.md)"
				'';
			}; 
		};
	};
}
