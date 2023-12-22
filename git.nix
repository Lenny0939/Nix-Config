{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		userName = "Lenny0939";
		userEmail = "lennyescott@gmail.com";
		extraConfig = {
			credential.helper = "${
				pkgs.git.override { withLibSecret = true; }
			}/bin/git-credential-libsecret";
		};
	};
}
