{
  specialArgs,
  pkgs,
  lib,
  ...
}:
with specialArgs; {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (
      if impermanence
      then inputs.disko.nixosModules.disko
      else {}
    )
    (
      if impermanence
      then inputs.impermanence.nixosModules.impermanence
      else {}
    )
    ./modules/nh.nix
    ./modules/options.nix
    ./modules/kanata.nix
    ./archive/machines/legolas/hardware-configuration-legolas.nix
    (
      if impermanence
      then import ./modules/disko.nix {device = "/dev/nvme0n1";}
      else {}
    )
  ];
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
  boot = lib.mkIf (gui == true) {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce null;
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      postDeviceCommands = ''
        mkdir /btrfs_tmp
        mount /dev/root_vg/root /btrfs_tmp
        if [[ -e /btrfs_tmp/root ]]; then
        	mkdir -p /btrfs_tmp/old_roots
        	timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%h:%M:%S")
        	mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
        fi

        delete_subvolume_recursively() {
        	IFS=$'\n'
        	for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        		delete_subvolume_recursively "/btrfs_tmp/$i"
        	done
        	btrfs subvolume delete "$1"
        }

        for i in $(find /btrfs_tmp/old-roots/ -maxdepth 1 -mtime +30); do
        	delete_subvolume_recursively "$i"
        done
        btrfs subvolume create /btrfs_tmp/root
        umount /btrfs_tmp
      '';
    };
    kernelParams = ["quiet" "udev.log_level=0"];
    kernelPackages = pkgs.linuxPackages_zen;
  };
  fileSystems."/persist".neededForBoot = true;
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
    users.lenny = {
      directories = [
        "nix"
        "home"
        "steam"
        ".mozilla"
      ];
      files = ["zsh_history"];
      home = "/home/lenny";
    };
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  hardware = {
    bluetooth.enable = gui;
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
        hashedPasswordFile = "/persist/passwords/lenny";
        isNormalUser = true;
        description = "Lenny";
        extraGroups = ["networkmanager" "wheel"];
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
