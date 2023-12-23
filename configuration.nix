# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
		./unique.nix
    ./hardware-configuration.nix
		./searx.nix
    inputs.home-manager.nixosModules.home-manager
  ];
	nixpkgs.overlays = [ (final: prev: {
		myHyprland = prev.hyprland.overrideAttrs (old: {
			src = prev.fetchFromGitHub {
				owner = "hyprwm";
				repo = "Hyprland";
				rev = "v0.33.1";
				# If you don't know the hash, the first time, set:
				# hash = "";
				# then nix will fail the build with such an error message:
				# hash mismatch in fixed-output derivation '/nix/store/m1ga09c0z1a6n7rj8ky3s31dpgalsn0n-source':
				# specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
				# got:    sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
				hash = "sha256-goxBCjjWitvx2Oq4AihpA2OhYEirolMLC48fdA7Iey8=";
			};
		});
	} ) ];	
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
  networking.hostName = "nixos"; # Define your hostname.
  users.defaultUserShell = pkgs.zsh;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home.nix;
    };
  };
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
  programs.hyprland = {
		enable = true;
		#package = pkgs.myHyprland;
	};
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
  #services.getty.autologinUser = "lenny";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
		lf
		dconf
  ];
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

  system.stateVersion = "23.11"; # Did you read the comment?
}
