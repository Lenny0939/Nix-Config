{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
		./searx.nix
    ../nixos-arm/sd-image-opi3lts.nix
		./minecraft.nix
    /*
       (builtins.fetchGit {
      url = "https://github.com/katyo/nixos-arm.git";
      ref = "master";
      rev = "ef5e339bcb8274c1127a1434d0c5f3ad80ea3692";
    })
    */
    #./nextcloud.nix
    #./wireguard-server.nix
    #./vaultwarden.nix
    ./blocky.nix
		./garf.nix
		../modules/sops.nix
    #./dashy.nix
  ];
	
	system.stateVersion = "23.05";
  nixpkgs.hostPlatform = "aarch64-linux";
  nix.settings = {
    substituters = [
      "https://sunxi64.cachix.org"
    ];
    trusted-public-keys = [
      "sunxi64.cachix.org-1:q5kIj6q7nUG/J88HPCwMYNzoesce9sl6hbVXji2buIQ="
    ];
  };
  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    supportedFilesystems = lib.mkForce ["btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs"];
    consoleLogLevel = lib.mkDefault 7;
    kernelParams = [
      "earlycon"
      "console=ttyS0,115200n8"
    ];
    initrd.availableKernelModules = ["sunxi-mmc"];
  };
  users = {
    mutableUsers = false;
    users = {
      lenny = {
        initialPassword = "password";
        isNormalUser = true;
        description = "Lenny";
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
        home = "/home/lenny";
      };
      root = {
        initialPassword = "password";
      };
    };
  };
hardware.firmware = [pkgs.uwe5622-firmware];
  networking = {
    hostName = "frodo";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8888
        80
        443
        53
        23
				25565
      ];
      allowedUDPPorts = [
        51820
        53
      ];
    };
    interfaces.wlp3s0.ipv4.addresses = [
      {
        address = "192.168.0.165";
        prefixLength = 24;
      }
    ];
  };
}
