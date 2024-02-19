{ config, lib, pkgs, ... }:
{
	services.spotifyd = {
		enable = true;
		settings = {
			global = {
				username = "8e1gctsj9m4vyqsupbimkn1xy";
				password = "${lib.removeSuffix "\n" (builtins.readFile config.sops.secrets.spotifypassword.path)}";
			};
					#${pkgs.coreutils}/bin/cat ${config.sops.secrets."spotifypassword".path}
				#password_cmd = "${pkgs.sops}/bin/sops -d --extract '[\"spotifypassword\"]' /home/lenny/nix/secrets/secrets.yaml";
		};
	};
}
