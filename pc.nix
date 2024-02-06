{ ... }:
{
	imports = [
		./modules/configuration.nix
		./modules/pc-hardware-configuration.nix
		./modules/fonts.nix
		./modules/scaling.nix
	];
	home-manager.users.lenny.scaling = 1.5;
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
	};
}
