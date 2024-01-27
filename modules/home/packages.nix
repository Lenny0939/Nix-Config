{ pkgs, ... }:
{  
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		/* Coding stuff */
			/* Neovim Dependencies */
				fd # idk, I think it may be related to fuzzy
				ripgrep # grep alternative, uses fuzzy finding
				nil # Nix language server. SO GOOD
				clang-tools # C language server
				luajitPackages.lua-lsp # Lua language server
			/* Rust */
				cargo # Rust package manager, really helpful for dev
				rust-analyzer # Dependency for rustaceanvim, LSP server for rust
				rustc # Rust compiler
			/* C */
				clang # C compiler
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
			bottom # Task manager except cool
			speedtest-cli
			# Most apps have their own modules
		/* Services */
			/* Notifications */
				libnotify # Notification system I think?
		/* Miscellaneous */
			hyprshot # Screenshot
			wl-clipboard
			pavucontrol
		  nix-search-cli
			swww # Wallpaper
			qmk # Keyboard software
			brightnessctl # Brightness control
			(pkgs.nerdfonts.override { fonts = [ "Hack" ]; }) # Font
  ];
}
