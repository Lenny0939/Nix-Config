{ pkgs, config, ... }:
{
	hardware.opengl = {
  	enable = true;
  	extraPackages = with pkgs; [
    	intel-media-driver
    ];
	};
}
