{ inputs, ... }:
{
	imports = [
		./all.nix
		./server-hardware-configuration.nix
		#./modules/searx.nix
		#./modules/serverstuff/nextcloud.nix
		#./modules/serverstuff/wireguard-server.nix
		#./modules/serverstuff/vaultwarden.nix
		#./modules/serverstuff/blocky.nix
		#./modules/serverstuff/dashy.nix
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./modules/home/server-home.nix;
    };
  };
	networking.firewall = {
		enable = true;
		allowedTCPPorts = [
			8888
			80
			443
		];
		allowedUDPPorts = [ 51820 ];
	};
}
