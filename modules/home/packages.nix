{ pkgs, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		/* Useless Rice Stuff */
			peaclock # Clock
			cmatrix # Matrix effect
			pipes # Cool pipes screensaver thingo
			cava # Cool audio visualiser
			neofetch # System info fetcher
			bottom # Task manager except cool
		/* Coding stuff */
			/* Neovim Dependencies */
				fd # idk, I think it may be related to fuzzy
				ripgrep # idk, I think it may be related to fuzzy
				nil # Nix language server. SO GOOD
				clang-tools # C language server
				luajitPackages.lua-lsp # Lua language server
			/* Rust */
				cargo # Rust package manager, really helpful for dev
				rust-analyzer # Dependency for rustaceanvim, LSP server for rust
				rustc # Rust
			/* C */
				gcc # C compiler
			/* Git */
				gh # Github cli
				git # Version control system
				lazygit # TUI for git, pretty cool but no idea how to use
			/* Godot */
    		godot_4 # Game engine
			/* C# */
				mono # C# compiler
		/* Apps */
			spotify-tui # Spotify TUI
			lf # File browser, not really sure how to use
			lutris # Game collection, I only really use steam so not very useful tbh
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify # Notification system I think?
			/* Screenshot */
				grim # Actual screenshotter
				slurp # Screen selector
				wl-clipboard # Copies stuff, like screenshots
		/* Miscellaneous */
			swww # Wallpaper engine, works really well
			mangohud # Overlay, like MSI Afterburner
			qmk # Keyboard software
			brightnessctl # Brightness control
			pulseaudio # Volume control
			(pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) # Font
  ];
}
