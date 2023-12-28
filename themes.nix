{ inputs, nix-colors, config, pkgs, ...}:
{
	imports = [
		inputs.nix-colors.homeManagerModules.default
	];
	colorScheme = inputs.nix-colors.colorSchemes.nord;
	gtk = {
		enable = true;
  	cursorTheme.package = pkgs.bibata-cursors;
  	cursorTheme.name = "Bibata-Modern-Ice";
  	iconTheme.package = pkgs.papirus-icon-theme;
  	iconTheme.name = "Papirus";
	};
}
