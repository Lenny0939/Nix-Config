{ config, ... }:
{
	services.mako = with config.colorScheme.palette; {
    enable = true;
		font = "${config.font}";
    backgroundColor = "#${base00}";
    borderColor = "#${base0E}";
    borderRadius = 5;
    borderSize = 2;
    textColor = "#${base05}";
    layer = "overlay";
		height = 200;
		defaultTimeout = 5000;
  };
}
