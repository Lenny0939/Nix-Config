{
  lib,
  inputs,
  pkgs,
  ...
}: {
  xdg.configFile = {"helix/themes/kleur.toml".source = lib.mkForce "${inputs.kleur.themes.${pkgs.system}.dark.build}/helix.toml";};
  programs.helix = {
    settings = {
      theme = lib.mkForce "kleur";
    };
  };
}
