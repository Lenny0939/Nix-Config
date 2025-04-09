{
  lib,
  inputs,
  pkgs,
  ...
}: {
	# xdg.configFile = {"helix/themes/catppuccin_mocha.toml" = lib.mkForce "./helix-themes/default_catppuccin_mocha.toml";};
  programs.helix = {
    settings = {
      theme = lib.mkForce "gruvbok_community";
    };
  };
}
