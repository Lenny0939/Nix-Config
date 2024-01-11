{ inputs, ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
 
	programs.home-manager.enable = true;
  imports = [
    inputs.hyprland.homeManagerModules.default
		./neofetch.nix
		./wofi.nix
		./git.nix
    ./hyprland.nix
    ./packages.nix
    ./zsh.nix
    ./themes.nix
    ./nvim
		./kitty.nix
		./waybar.nix
		./spotify.nix
		./mako.nix
  ];
}
