{ config, pkgs, lib, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		lua
		searxng
		swappy
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
