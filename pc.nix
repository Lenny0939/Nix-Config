{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./all.nix
		./not-server.nix
		./pc-hardware-configuration.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./pc-home.nix;
    };
  };
  networking.hostName = "pc"; # Define your hostname.
	environment.sessionVariables = rec { WLR_NO_HARDWARE_CURSORS = "1"; };
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
	};
}
