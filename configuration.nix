{ specialArgs, pkgs, inputs, lib, config, ... }:
with specialArgs;
{
	imports = [
		./modules/nh.nix
		./modules/keyd.nix
		./archive/machines/legolas/hardware-configuration-legolas.nix
	];
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
	users.defaultUserShell = pkgs.zsh;
	programs = {
		zsh.enable = true;
		nh.enable = true;
		neovim = {
			enable = true;
			defaultEditor = true;
		};
		gamemode.enable = games;
		hyprland.enable = gui;
		steam.enable = true;
	};
	powerManagement.enable = laptop;
  boot = lib.mkIf (gui == true) {
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
		kernelParams = [ "quiet" "udev.log_level=0" ];
		kernelPackages = pkgs.linuxPackages_zen;
	};
 systemd.tmpfiles.settings = {
    "10-create-home" = {
       "/users/lenny/home" = {
         d = {
           group = "root";
           mode = "0700";
           user = "lenny";
         };
       };
    };
	};
  systemd.services.NetworkManager-wait-online.enable = false;
	hardware = {
		bluetooth.enable = gui;
		graphics = {
			enable = gui;
			extraPackages = lib.mkIf (laptop) [ pkgs.intel-media-driver ];
		};
	};
	services = {
		blueman.enable = gui;
		tlp.enable = laptop;
		keyd.enable = laptop;
		pipewire = {
			enable = true;
			alsa = {
				enable = true;
				support32Bit = true;
			};
			pulse.enable = true;
		};
		xserver.videoDrivers = lib.mkIf (desktop) [ "nvidia" ];
	};
	networking.networkmanager.enable = true;
	networking.hostName = if laptop then
	  "legolas"
	else if server then 
		"frodo"
	else
		"aragorn";
  users.users.lenny = {
    isNormalUser = true;
    description = "Lenny";
    extraGroups = [ "networkmanager" "wheel" ];
		home = "/users/lenny";

    # This is required until this is merged: 
    #   https://github.com/NixOS/nixpkgs/pull/324618
    # Reasoning in the PR
    homeMode = "0755";

    createHome = true;
  };
	system.stateVersion = "24.11";
}
