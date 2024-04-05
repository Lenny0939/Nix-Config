{ inputs, ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
	home.stateVersion = "24.05"; 
  nix.gc = {
		automatic = true;
		frequency = "weekly";
		options = "--delete-older-than 30d";
	};
	programs.home-manager.enable = true;
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.stylix.homeManagerModules.stylix
		./mangohud.nix
		./firefox.nix
		./fastfetch.nix
		./wofi.nix
		./git.nix
    ./hyprland/hyprland.nix
    ./packages.nix
    ./zsh.nix
    ./themes.nix
		./nixvim.nix
		./kitty.nix
		./eww/eww.nix
		#./spotify.nix
		./mako.nix
		./lf.nix
	];
}
