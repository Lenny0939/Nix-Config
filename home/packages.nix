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
			/* Neovim Dependencies */
				fd # lists files, needed for telescope and also cool finding thingo
				ripgrep # grep alternative, uses fuzzy finding
				nil # Nix language server
				clang-tools # C language server
			/* Rust */
				cargo
				rust-analyzer # Dependency for rustaceanvim, LSP server for rust
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
		/* Apps */
			spotify-tui 
			spotify
			tetrio-desktop
			bottom # Task manager except cool
			speedtest-cli
			discord
			pavucontrol
			yt-dlp
			audacity
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify
		/* Miscellaneous */
			hyprshot 
			fzf
			wl-clipboard
		  nix-search-cli
			swww 
			qmk 
			brightnessctl 
			easyeffects
			trashy
			(pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) # Font
  ];
}
