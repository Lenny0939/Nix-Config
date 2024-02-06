{ inputs, lib, pkgs, ... }:
{
	imports = [
		./modules/all.nix
		./modules/serverstuff/server-hardware-configuration.nix
		./modules/searx.nix
		#./modules/serverstuff/nextcloud.nix
		#./modules/serverstuff/wireguard-server.nix
		#./modules/serverstuff/vaultwarden.nix
		./modules/serverstuff/blocky.nix
		#./modules/serverstuff/dashy.nix
	];
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
      lenny = import ./modules/home/server-home.nix;
    };
  };
	networking = {
		firewall = {
			enable = true;
			allowedTCPPorts = [
				8888
				80
				443
				53
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
