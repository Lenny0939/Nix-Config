{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./all.nix
		./server-hardware-configuration.nix
		./searx.nix
	];
}
