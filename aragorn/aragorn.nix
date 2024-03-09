{ ... }:
{
	imports = [
		../gui.nix
		./hardware-configuration-aragorn.nix
		../modules/fonts.nix
	];
	home-manager.users.lenny.wayland.windowManager.hyprland.settings.monitor = ",highres,auto,1.6";
	networking.hostName = "aragorn"; 
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
