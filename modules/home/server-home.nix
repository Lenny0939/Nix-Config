{ ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
  imports = [
		./git.nix
    ./server-packages.nix
    ./zsh.nix
    ./nvim
  ];
}
