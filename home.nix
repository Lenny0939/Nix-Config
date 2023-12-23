{ inputs, pkgs, lib, ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
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
		./waybar.nix
		./spotify.nix
  ];
}
