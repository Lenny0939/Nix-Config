{ inputs, pkgs, lib, ... }:

{
	imports = [ 
		inputs.sops-nix.nixosModules.sops
		#./home/spotify.nix
		./modules/homework.nix
		./configuration.nix
		./modules/printer.nix
	];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
	nix.optimise.automatic = true;
  boot = {
	  loader = {
		  systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = null;
		};
    initrd.systemd.enable = true;
		binfmt.emulatedSystems = [ "aarch64-linux" ];
		kernelPackages = pkgs.linuxPackages_latest;
	};
	programs.hyprland = {
		enable = true;
	};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
	networking.nameservers = [ "192.168.0.11" ];
	networking.resolvconf.enable = lib.mkForce false;
	#networking.nameservers = [ "1.1.1.1"];
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home/home.nix;
    };
  };
  fonts.packages = with pkgs; [
		hack-font
		(nerdfonts.override { fonts = ["Hack"]; })
  ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd Hyprland";
				command = "${pkgs.hyprland}/bin/Hyprland";
        user = "lenny";
      };
			default_session = initial_session;
    };
  };

  system.stateVersion = "24.05";
}
