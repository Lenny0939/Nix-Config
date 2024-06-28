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
		enable = true;
		image = ../wallpapers/valley.png;
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		#base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
		opacity.terminal = 0.8;
		fonts = {
			monospace = {
				package = (pkgs.nerdfonts.override { fonts = ["Iosevka"]; });
				name = "Iosevka Light";
			};
		};
		cursor = {
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Ice";
		};
	};
	blur = false;
}
