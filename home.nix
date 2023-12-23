<<<<<<< HEAD
{ inputs, pkgs, ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
  imports = [
    inputs.hyprland.homeManagerModules.default
		./wofi.nix
		./git.nix
    ./packages.nix
    #./hyprland.nix
=======
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
>>>>>>> pc
    ./zsh.nix
    ./themes.nix
    ./nvim
    ./firefox.nix
		./kitty.nix
<<<<<<< HEAD
		./waybar.nix
  ];
=======
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
>>>>>>> pc
}
