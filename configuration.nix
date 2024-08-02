{ config, specialArgs, pkgs, lib, ... }:
with specialArgs;
{
	imports = [
		inputs.home-manager.nixosModules.home-manager
		(if impermanence then inputs.disko.nixosModules.disko else {})
		(if impermanence then import ./modules/disko.nix { device = "/dev/nvme0n1"; } else {})
		(if impermanence then inputs.impermanence.nixosModules.impermanence else {})
		(modulesPath + "/installer/scan/not-detected.nix")
		./modules/options.nix
		./modules/kanata.nix
		./modules/nh.nix
	];
	nixpkgs = {
		config.allowUnfree = true;
		hostPlatform = lib.mkDefault "x86_64-linux";
	};
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
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
			package = pkgs.steam.override {
				extraEnv = {
					HOME = "/users/lenny/steam";
				};
			};
		};
	};
	hardware.steam-hardware.enable = games;
	powerManagement.enable = laptop;
  boot = lib.mkIf (gui) {
	  loader = {
		  systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce null;
		};
		consoleLogLevel = 0;
    initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
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
		kernelModules = if desktop then [ "kvm-amd" ]
		else [ "kvm-intel" ];
		kernelParams = [ "quiet" "udev.log_level=0" ];
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
			files = [ "zsh_history" ];
			home = "/users/lenny";
		};
	};
	systemd.tmpfiles = {
		settings = {
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
		rules = [
			"d /persist/users/ 0777 root root"
			"d /persist/users/lenny 0700 lenny users -"
		];
	};
  systemd.services.NetworkManager-wait-online.enable = false;
	hardware = {
		nvidia = lib.mkIf (desktop) {
			modesetting.enable = true;
			open = false;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
		};
		bluetooth.enable = gui;
		graphics = {
			enable = gui;
			extraPackages = lib.mkIf (laptop) [ pkgs.intel-media-driver ];
		};
		cpu = {
			amd.updateMicrocode = lib.mkIf (desktop) config.hardware.enableRedistributableFirmware;
			intel.updateMicrocode = lib.mkIf (laptop) config.hardware.enableRedistributableFirmware;
		};
	};
	services = {
		getty.autologinUser = lib.mkIf (vm) "lenny";
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
		xserver.videoDrivers = lib.mkIf (desktop) [ "nvidia" ];
	};
  users = {
		mutableUsers = false;
		defaultUserShell = pkgs.zsh;
		users = { 
			lenny = {
				initialPassword = "password";
				hashedPasswordFile = "/persist/passwords/lenny";
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
			root = {
				hashedPasswordFile = "/persist/passwords/root";
				initialPassword = "password";
			};
		};
	};
	networking = {
		useDHCP = lib.mkDefault true;
		networkmanager.enable = true;
		hostName = if laptop then
			"legolas"
		else if server then 
			"frodo"
		else
			"aragorn";
	};
	home-manager = {
		extraSpecialArgs = specialArgs; 
		users = {
			lenny = import ./home/home.nix;
		};
  };
  fileSystems = { 
		"/" = if desktop then
    	{ device = "/dev/disk/by-uuid/ce6b7dd2-5df7-49b7-bd87-45c6c86ee0fb";
      	fsType = "ext4";
    	}
		else 
			{ device = "/dev/disk/by-uuid/0b5746da-2914-406c-8771-b9be1cb25652";
				fsType = "ext4";
			};

  "/boot" = if desktop then
    { device = "/dev/disk/by-uuid/4239-6CA4";
      fsType = "vfat";
    }
		else
    { device = "/dev/disk/by-uuid/BF18-BB3C";
      fsType = "vfat";
    };
	};
  #nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	system.stateVersion = "24.11";
}
