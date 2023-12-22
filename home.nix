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
    ./zsh.nix
    ./themes.nix
    ./nvim
    ./firefox.nix
		./kitty.nix
		./waybar.nix
  ];
}
