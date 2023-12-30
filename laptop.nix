{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./modules/configuration.nix
		./modules/laptop-hardware-configuration.nix
	];
	services.tlp.enable = true;
	networking.hostName = "laptop";
	hardware.opengl = {
		enable = true;
		extraPackages = with pkgs; [
			intel-media-driver
		];
	};
}
