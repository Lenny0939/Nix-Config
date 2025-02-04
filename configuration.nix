{
  specialArgs,
  pkgs,
  lib,
	config,
  ...
}:
with specialArgs; {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		(
			if desktop 
			then import ./archive/machines/aragorn/hardware-configuration-aragorn.nix
			else  {}
		)
    ./modules/nh.nix
    ./modules/options.nix
    ./modules/kanata.nix
    (
      if impermanence
      then import ./modules/impermanence.nix
      else {}
     )
  ];
	fonts.fontconfig.allowBitmaps = true;
	environment.systemPackages = [ pkgs.dolphin-emu ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  programs = {
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
    };
  };
  hardware.steam-hardware.enable = games;
  powerManagement.enable = laptop;
	console = {
		earlySetup = true;
		font = "${pkgs.spleen}/share/consolefonts/spleen-16x32.psfu";
		packages = with pkgs; [ spleen ];
	};
  boot = lib.mkIf (gui == true) {
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
    getty.autologinUser = lib.mkIf vm "lenny";
    blueman.enable = gui;
    tlp.enable = laptop;
    kanata.enable = laptop;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver.videoDrivers = lib.mkIf desktop ["nvidia"];
  };
        environment.variables = {
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
        #hashedPasswordFile = "/persist/passwords/lenny";
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
  home-manager = {
    extraSpecialArgs = specialArgs;
    users = {
      lenny = import ./home/home.nix;
    };
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "24.11";
}
