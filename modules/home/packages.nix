{ pkgs, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		rust-analyzer
		rustc
		cmatrix
		pipes
		lf
		gh
		lazygit
		lua
		searxng
		spotify-tui
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
		nil
		clang-tools
		luajitPackages.lua-lsp
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
