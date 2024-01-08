{ config, ... }:
{
	services.mako = with config.colorScheme.colors; {
    enable = true;
    backgroundColor = "#${base00}";
    borderColor = "#${base0E}";
    borderRadius = 5;
    borderSize = 2;
    textColor = "#${base05}";
    layer = "overlay";
  };
}
