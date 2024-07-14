{ inputs, ... }: 
{
  home = { 
		username = "lenny";
  	#homeDirectory = "/users/lenny";
		stateVersion = "24.05"; 
	};
		xdg = {
			enable = true;
      configHome = "/users/lenny/config";
      cacheHome = "/users/lenny/config/cache";
      dataHome = "/users/lenny/config/local/share";
      stateHome = "/users/lenny/config/local/state";
		};
  nix.gc = {
		automatic = true;
		frequency = "weekly";
		options = "--delete-older-than 30d";
	};
	programs.home-manager.enable = true;
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.stylix.homeManagerModules.stylix
		inputs.ssbm.homeManagerModule
		../scripts/wallpaper.nix
		./ssbm.nix
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
