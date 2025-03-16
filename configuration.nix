{
  specialArgs,
  pkgs,
  lib,
	config,
	lix-module,
  ...
}:
with specialArgs; {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.lix-module.nixosModules.default
		(
			if desktop 
			then import ./archive/machines/aragorn/hardware-configuration-aragorn.nix
			else  {}
		)
		./modules/sops.nix
    ./modules/nh.nix
    ./modules/options.nix
    ./modules/kanata.nix
    (
      if impermanence
      then import ./modules/impermanence.nix
      else {}
     )
  ] ++ (if server then [
    inputs.disko.nixosModules.disko
    ./frodo/hardware-configuration.nix
    ./disko-config.nix
    ./frodo/searx.nix
    ./frodo/minecraft.nix
  ] else []);
	fonts.fontconfig.allowBitmaps = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  programs = {
  	gamescope = {
    	enable = games;
			capSysNice = true;
		};
    adb.enable = laptop;
    zsh.enable = true;
    nh.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    gamemode.enable = games;
    hyprland.enable = gui;
    steam = {
      enable = games;
			gamescopeSession.enable = true;
			package = pkgs.steam.override {
				/* extraPkgs = pkgs: with pkgs; [
					libkrb5
					keyutils
				]; */
  extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
			};
    };
  };
  hardware.steam-hardware.enable = games;
  powerManagement.enable = laptop;
	console = {
		earlySetup = true;
		font = "${pkgs.spleen}/share/consolefonts/spleen-16x32.psfu";
		packages = with pkgs; [ spleen ];
	};
  boot = {
		binfmt.emulatedSystems = lib.mkIf desktop [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce null;
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
    };
    kernelParams = ["quiet" "udev.log_level=0"];
    kernelPackages = pkgs.linuxPackages_zen;
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  hardware = {
    bluetooth.enable = gui;
		nvidia = lib.mkIf desktop {
			open = false;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
		};
    graphics = {
      enable = gui;
      extraPackages = lib.mkIf laptop [pkgs.intel-media-driver];
    };
  };
  services = {
		openssh = {
			enable = true;
		};
    getty.autologinUser = lib.mkIf vm "lenny";
    blueman.enable = gui;
    tlp.enable = laptop;
    kanata.enable = laptop;
    pipewire = {
      enable = gui;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver.videoDrivers = lib.mkIf desktop ["nvidia"];
  };
        environment.variables = lib.mkIf gui {
          VST_PATH = "/nix/var/nix/profiles/default/lib/vst:~/.nix-profile/lib/vst:~/.vst";
          LXVST_PATH = "/nix/var/nix/profiles/default/lib/lxvst:~/.nix-profile/lib/lxvst:~/.lxvst";
          LADSPA_PATH = "/nix/var/nix/profiles/default/lib/ladspa:~/.nix-profile/lib/ladspa:~/.ladspa";
          LV2_PATH = "/nix/var/nix/profiles/default/lib/lv2:~/.nix-profile/lib/lv2:~/.lv2";
          DSSI_PATH = "/nix/var/nix/profiles/default/lib/dssi:~/.nix-profile/lib/dssi:~/.dssi";
        };
  networking.networkmanager.enable = true;
  networking.hostName =
    if laptop
    then "legolas"
    else if server
    then "frodo"
    else if vm
    then "vm"
    else if desktop
    then "aragorn"
    else "computer";
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    users = {
      lenny = {
        initialPassword = "password";
        isNormalUser = true;
        description = "Lenny";
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
        home = "/home/lenny";
      };
      root = {
        hashedPasswordFile = "/persist/passwords/root";
        initialPassword = "password";
      };
    };
  };
  home-manager = lib.mkIf gui {
    extraSpecialArgs = specialArgs;
    users = {
      lenny = if server then import ./frodo/home-frodo.nix else ./home/home.nix;
    };
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "24.11";
}
