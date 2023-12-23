{ inputs, pkgs, lib, ... }: 
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
  imports = [
    inputs.hyprland.homeManagerModules.default
		./wofi.nix
    ./packages.nix
    ./hyprland.nix
		./mangohud.nix
    ./zsh.nix
    ./themes.nix
    ./nvim
    ./firefox.nix
		./kitty.nix
		./spotify.nix
  ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  programs.starship = {
    enable = true;
    #settings = pkgs.lib.importTOML ./starship.toml;
  };
	#programs.waybar = {
	#	enable = true;
	#	extraConfig = ''
	#		
	#	'';
	#};
  programs.home-manager.enable = true;
}
