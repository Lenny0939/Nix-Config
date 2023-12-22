{ config, pkgs, ... }:
{
	programs.wofi = {
		enable = true;
		settings = {
			insensitive= true;
		};
	};
}
