{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${hyprland-session}";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop";
  greetd-script = pkgs.writeShellScriptBin "greetd-script" '''';
in
{
  imports = [
    #./home/spotify.nix
    #../modules/homework.nix
    ./configuration.nix
    ../modules/printer.nix
    ../machines/frodo/searx.nix
    #../modules/keyd.nix
    inputs.ssbm.nixosModule
  ];

  ssbm.overlay.enable = true;
  services.joycond.enable = true;
  hardware.steam-hardware.enable = true;
  virtualisation.docker.enable = true;
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        HOME = "/users/lenny/steam";
      };
    };
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamemode.enable = true;
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce null;
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    kernelParams = [
      "quiet"
      "udev.log_level=0"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
  };
  programs.hyprland.enable = true;
  networking.nameservers = [
    "192.168.0.11"
    "1.1.1.1"
  ];
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ../home/home.nix;
    };
  };
  /*
       services.greetd = {
      enable = false;
      settings = rec {
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
        default_session = {
    		command = "export HOME='/users/lenny' && ${tuigreet}";
    		user = "lenny";
    	};
    };
    };
  */

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  /*
       systemd.services.greetd.serviceConfig = {
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
