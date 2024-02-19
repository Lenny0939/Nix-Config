{ inputs, ... }: 
{
  home.username = "lenny";
  home.homeDirectory = "/home/lenny";
  home.stateVersion = "24.05"; 
  programs.home-manager.enable = true;
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./fastfetch.nix
		./git.nix
    ./packages-frodo.nix
    ./nixvim.nix
  ];
}
