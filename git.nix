{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		userName = "Lenny0939";
		userEmail = "lennyescott@gmail.com";
		extraConfig = {
			credential.helper = "${
				pkgs.git.override { withlibSecret = true; }
			}/bin/git-credential-libsecret";
		};
	};
}
