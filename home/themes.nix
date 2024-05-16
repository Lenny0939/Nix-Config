{ pkgs, ...}:
{
	gtk = {
		enable = true;
  	cursorTheme.package = pkgs.bibata-cursors;
  	cursorTheme.name = "Bibata-Modern-Ice";
  	iconTheme.package = pkgs.papirus-icon-theme;
  	iconTheme.name = "Papirus";
	};
	stylix = {
		image = ../wallpapers/castle.png;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		opacity.terminal = 0.7;
		fonts = {
			monospace = {
				package = (pkgs.nerdfonts.override { fonts = ["Iosevka"]; });
				name = "Iosevka";
			};
		};
		cursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Ice";
		};
	};
}
