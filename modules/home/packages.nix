{ config, pkgs, lib, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		playerctl
		gh
		lazygit
		lua
		searxng
		swappy
		spotify-tui
		steam-tui
		mangohud
		grim
		swww
		slurp
		bottom
		libnotify
		mako
		qmk
		cava
		mono
		cmake
		git
		wofi
    lutris
    neofetch
    pulseaudio
    brightnessctl
    starship
    hyprpaper
    godot_4
		gcc
    #obsidian
		# neovim dependencies (move possibly?)
		fd
		ripgrep
		wl-clipboard
		rnix-lsp
		clang-tools
		luajitPackages.lua-lsp
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
