{inputs, ...}: {
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  imports = [
    ../home/git.nix
    ../home/zsh.nix
  ];
}
