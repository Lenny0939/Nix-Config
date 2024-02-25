{ pkgs, ... }:
{
	programs.bat = {
		enable = true;
		config.theme = "catppuccin-mocha";
		themes.catppuccin-mocha = {
			src = pkgs.fetchFromGitHub {
				owner = "catppuccin";
				repo = "bat"; # Bat uses sublime syntax for its themes
				rev = "refs/heads/main";
				sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
			};
			file = "Catppuccin-mocha.tmTheme";
		};
	};
}
