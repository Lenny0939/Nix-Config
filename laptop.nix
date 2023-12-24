{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./all.nix
		./configuration.nix
		./laptop-hardware-configuration.nix
	];
	networking.hostName = "laptop";
	hardware.opengl = {
		enable = true;
		extraPackages = with pkgs; [
			intel-media-driver
		];
	};
}
