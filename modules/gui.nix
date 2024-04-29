{ inputs, pkgs, lib, ... }:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
	steam-session = "${pkgs.xorg.xinit}/bin/startx /home/lenny/.xinitrc";
  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions/hyprland.desktop";
in
{
	imports = [ 
		#./home/spotify.nix
		../modules/homework.nix
		./configuration.nix
		../modules/printer.nix
		#../modules/keyd.nix
	];

	services.xserver.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  boot = {
	  loader = {
		  systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce null;
		};
    initrd.systemd.enable = true;
		kernelPackages = pkgs.linuxPackages_latest;
	};
	programs.hyprland.enable = true;
	security.pam.services.hyprlock = {};
	systemd.user.services.hypridle.enable = true;
	networking.nameservers = [ "192.168.0.11" "1.1.1.1" ];
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ../home/home.nix;
    };
  };
  fonts.packages = with pkgs; [
		hack-font
		(nerdfonts.override { fonts = ["Hack"]; })
  ];
  services.greetd = {
    enable = true;
    settings = rec {
			/*
			hyprland-session = {
				command = "${hyprland-session}";
				#command = "${pkgs.hyprland}/bin/Hyprland";
				user = "lenny";
			};
			steam-session = {
				command = "${steam-session}";
				user = "lenny";
			};
			tuigreet = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
        user = "greeter";
			};
			*/
      default_session = {
				command = "Hyprland";
				user = "lenny";
			};
		};
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  /* systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
  */
  system.stateVersion = "24.05";
}
