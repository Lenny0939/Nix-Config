{ ... }:
{
	services.spotifyd = {
		enable = true;
		settings = {
			global = {
				username = "8e1gctsj9m4vyqsupbimkn1xy";
				password = /home/lenny/nix/modules/home/spotifypassword;
			};
		};
	};
}
