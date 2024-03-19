{ modulesPath, lib, ... }: 
{
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
		./gui.nix
	];
	nixpkgs.hostPlatform = "x86_64-linux";
	networking.wireless.enable = lib.mkForce false;
	isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
