{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./configuration.nix
		./server-hardware-configuration.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./server-home.nix;
    };
  };
  networking.hostName = "lennys-server"; # Define your hostname.
}
