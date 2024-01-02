{ ... }:
{
	imports = [
		./modules/configuration.nix
		./modules/pc-hardware-configuration.nix
	];
	networking.hostName = "pc"; 
	environment.sessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };
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
