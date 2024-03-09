{ inputs, pkgs, lib, ... }:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
in
{
	imports = [ 
		inputs.sops-nix.nixosModules.sops
		./home/spotify.nix
		./modules/homework.nix
		./configuration.nix
		./modules/printer.nix
	];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  boot = {
	  loader = {
		  systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = null;
		};
    initrd.systemd.enable = true;
		kernelPackages = pkgs.linuxPackages_latest;
	};
	programs.hyprland = {
		enable = true;
	};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
	networking.nameservers = [ "192.168.0.11" ];
	networking.resolvconf.enable = lib.mkForce false;
	#networking.nameservers = [ "1.1.1.1"];
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home/home.nix;
    };
  };
  fonts.packages = with pkgs; [
		hack-font
		(nerdfonts.override { fonts = ["Hack"]; })
  ];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        #command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
				command = "Hyprland";
        #user = "greeter";
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
