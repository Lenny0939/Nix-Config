{ inputs, nix-colors, config, pkgs, ...}:
{
	imports = [
		inputs.nix-colors.homeManagerModules.default
	];
	#colorScheme = inputs.nix-colors.colorSchemes.nord;
	#colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
	colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
	#colorScheme = inputs.nix-colors.colorSchemes.kanagawa;
	#colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
	#colorscheme = inputs.nix-colors.colorSchemes.everforest/*-dark-hard*/;
	gtk = {
		enable = true;
  	cursorTheme.package = pkgs.bibata-cursors;
  	cursorTheme.name = "Bibata-Modern-Ice";
  	iconTheme.package = pkgs.papirus-icon-theme;
  	iconTheme.name = "Papirus";
	};
}
