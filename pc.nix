{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./modules/configuration.nix
		./modules/pc-hardware-configuration.nix
	];
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
