{ config, pkgs, lib, ... }:
<<<<<<< HEAD
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		gh
		lazygit
		lua
		searxng
		swappy
=======
{
  home.packages = with pkgs; [
		spotify-tui
		steam-tui
		mangohud
>>>>>>> pc
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
<<<<<<< HEAD
=======
		git
		wofi
>>>>>>> pc
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
