{ inputs, lib, pkgs, ... }:
{
	imports = [
		../configuration.nix
		./searx.nix
		../nixos-arm/sd-image-opi3lts.nix
		/* pkgs.fetchFromGitHub {
		  owner = "katyo";
		  repo = "nixos-arm";
		  rev = "master";
		  hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
		} */
		#./nextcloud.nix
		#./wireguard-server.nix
		#./vaultwarden.nix
		./blocky.nix
		#./dashy.nix
	];
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
		supportedFilesystems = lib.mkForce [ "btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs" ];
		consoleLogLevel = lib.mkDefault 7;
		kernelParams = [
			"earlycon"
			"console=ttyS0,115200n8"
		];
		initrd.availableKernelModules = [ "sunxi-mmc"];
	};
	services.openssh = {
		enable = true;
	};
	hardware.firmware = [ pkgs.uwe5622-firmware ];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home-frodo.nix;
    };
  };
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
			];
			allowedUDPPorts = [ 
				51820 
				53
			];
		};
		interfaces.wlp3s0.ipv4.addresses = [{
			address = "192.168.0.11";
			prefixLength = 24;
		}];
	};
}
