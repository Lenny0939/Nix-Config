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
			ripgrep # grep alternative
			fzf
			lsd
			ncdu
			bat
		/* Apps */
			spotify
			tetrio-desktop
			qmk
			bottom # Task manager except cool
			speedtest-cli
			acpi
			discord
			pavucontrol
			yt-dlp
			audacity
			qmk
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify
		/* Miscellaneous */
			playerctl
			xorg.xinit
			hyprshot 
			wl-clipboard
		  nix-search-cli
			swww 
			qmk 
			brightnessctl 
			easyeffects
			trashy
			eww
			shipwright
			(pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) # Font
  ];
}
