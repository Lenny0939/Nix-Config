{ config, pkgs, inputs, ... }:
{
	services.spotifyd = {
		enable = true;
		settings = {
			global = {
				username = "8e1gctsj9m4vyqsupbimkn1xy";
				#password_cmd = "${pkgs.coreutils}/bin/cat /home/lenny/spotifypassword";
				#password_cmd = "${pkgs.coreutils}/bin/cat ${config.sops.secrets."spotifypassword".path}";
			};
		};
	};
}
