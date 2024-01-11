{ inputs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home/home.steamnix;
    };
  };
}
