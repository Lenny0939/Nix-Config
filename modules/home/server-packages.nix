{ pkgs, ... }:
{
	nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
		fd
		ripgrep
		nil
		git
	];
}
