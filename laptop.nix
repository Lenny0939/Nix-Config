{ config, pkgs, lib, ... }:
{
	imports = [
		./configuration.nix
		./laptop-hardware-configuration.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./laptop-home.nix;
    };
  };
	programs.hyprland = {
		enable = true;
	};
  networking.hostName = "laptop";
	hardware.opengl = {
		enable = true;
		#put drivers here, just forgor
	};
}
