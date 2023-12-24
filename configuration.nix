# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
	imports = [ 
		./searx.nix
    inputs.home-manager.nixosModules.home-manager
	];
  programs.zsh.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.plymouth.enable = true;
  #boot.plymouth.theme = "breeze";
  boot.initrd.systemd.enable = true;
  boot.loader.timeout = null;

  systemd.services.NetworkManager-wait-online.enable = false;
	powerManagement.enable = true;
	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 16*1024;
	}];
  users.defaultUserShell = pkgs.zsh;
  	console = {
		earlySetup = true;
		keyMap = "colemak";
	};
  # Enable video
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lenny = {
    isNormalUser = true;
    description = "Lenny";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable automatic login for the user.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
		hack-font
		(nerdfonts.override { fonts = ["Hack"]; })
  ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "lenny";
      };
      default_session = initial_session;
    };
  };

  system.stateVersion = "24.05";
}
