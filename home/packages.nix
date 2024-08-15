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
			/* Git */
				gh 
				git 
			/* Godot */
    		godot_4 
		/* Utilities */
			zip
			unzip
			fd # lists files, needed for telescope and also cool finding thingo
			ripgrep # grep alternative
			fzf
			lsd
			ncdu
			bat
			nix-output-monitor
		/* Apps */
			spotify
			blanket
			qmk
			bottom # Task manager except cool
			speedtest-cli
			acpi
			discord
			pavucontrol
			yt-dlp
			audacity
			qmk
			prismlauncher
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify
		/* Miscellaneous */
			playerctl
			hyprshot 
			wl-clipboard
		  nix-search-cli
			swww 
			qmk 
			brightnessctl 
			easyeffects
			trashy
  ];
}
