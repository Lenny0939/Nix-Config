{ pkgs, ... }:
{
	imports = [
		../../modules/gui.nix
		./hardware-configuration-legolas.nix
	];
	services.tlp.enable = true;
	networking.hostName = "legolas";
	hardware.opengl = {
		enable = true;
		extraPackages = with pkgs; [
			intel-media-driver
		];
	};
}
