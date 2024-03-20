{ inputs, pkgs, ...}:
{
	colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
	gtk = {
		enable = true;
  	cursorTheme.package = pkgs.bibata-cursors;
  	cursorTheme.name = "Bibata-Modern-Ice";
  	iconTheme.package = pkgs.papirus-icon-theme;
  	iconTheme.name = "Papirus";
	};
	stylix = {
		image = ./wallpaper.jpeg;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		opacity.terminal = 0.0;
		fonts = {
			monospace = {
				package = (pkgs.nerdfonts.override { fonts = ["Hack"]; });
				name = "Hack Nerd Font";
			};
		};
		cursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Ice";
		};
	};
}
