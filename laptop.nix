{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./all.nix
		./not-server.nix
		./laptop-hardware-configuration.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./laptop-home.nix;
    };
  };
	networking.hostName = "laptop";
	hardware.opengl = {
		enable = true;
		extraPackages = with pkgs; [
			intel-media-driver
		];
	};
}
