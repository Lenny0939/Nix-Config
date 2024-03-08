{ pkgs, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		/* Useless Rice Stuff */
			peaclock # Clock
			cmatrix # Matrix effect
			pipes # Cool pipes screensaver thingo
			cava # Cool audio visualiser
		/* Gaming */
			#lutris
			mangohud # Overlay, like MSI Afterburner
		/* Coding stuff */
			/* LSP Language Servers */
				nil # Nix language server
				clang-tools # C language server
			/* Rust */
				cargo
				rustc
			/* C */
				gnumake
				clang
			/* Git */
				gh 
				git 
				lazygit # TUI for git, pretty cool but no idea how to use
			/* Godot */
    		godot_4 
			/* C# */
				mono 
			/* Python */
				python3
		/* Utilities */
			fd # lists files, needed for telescope and also cool finding thingo
			ripgrep # grep alternative, uses fuzzy finding
			fzf
			lsd
			ncdu
		/* Apps */
			spotify-tui 
			spotify
			tetrio-desktop
			bottom # Task manager except cool
			speedtest-cli
			discord
			pavucontrol
			yt-dlp
			yuzu
			audacity
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify
		/* Miscellaneous */
			hyprshot 
			wl-clipboard
		  nix-search-cli
			swww 
			qmk 
			brightnessctl 
			easyeffects
			trashy
			shipwright
			(pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) # Font
  ];
}
