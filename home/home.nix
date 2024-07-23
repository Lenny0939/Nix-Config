{ specialArgs, inputs, ... }: 
{
  home = { 
		username = "lenny";
		stateVersion = "24.05"; 
	};
	programs = {
		home-manager.enable = true;
		firefox.enable = specialArgs.gui;
		wofi.enable = specialArgs.gui;
		git.enable = true;
		zsh.enable = true;
		zoxide.enable = true;
		nixvim.enable = true;
		kitty.enable = true;
	};
	services = {
		mako.enable = true;
	};
	stylix.enable = specialArgs.gui;
	gtk.enable = specialArgs.gui;
	wayland.windowManager.hyprland.enable = specialArgs.gui;
	xdg.enable = true;
  imports = [
		../modules/options.nix
		inputs.nixvim.homeManagerModules.nixvim
		inputs.stylix.homeManagerModules.stylix
		../scripts/wallpaper.nix
		./xdg.nix
		./mangohud.nix
		./firefox.nix
		./fastfetch.nix
		./wofi.nix
		./git.nix
    ./hyprland.nix
    ./packages.nix
    ./zsh.nix
    ./themes.nix
		./nixvim.nix
		./kitty.nix
		./eww.nix
		./mako.nix
		./lf.nix
	];
}

