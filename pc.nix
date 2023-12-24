{ config, pkgs, lib, ... }:
{
	imports = [
		./configuration.nix
		./pc-hardware-configuration.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./pc-home.nix;
    };
  };
	programs.hyprland = {
		enable = true;
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
