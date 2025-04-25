{ lib, ... }:
with lib;
{
  options.specialArgs = {
    gui = mkOption {
      type = types.bool;
      default = false;
      description = "enables WM and gui programs";
    };
    laptop = mkOption {
      type = types.bool;
      default = false;
      description = "enables keyd and laptop-specific stuff such as powersaving";
    };
    desktop = mkOption {
      type = types.bool;
      default = false;
      description = "enables nvidia drivers";
    };
    games = mkOption {
      type = types.bool;
      default = false;
      description = "enables steam and stuff";
    };
  };
}
