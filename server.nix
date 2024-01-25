{ inputs, ... }:
{
	imports = [
		./modules/all.nix
		./modules/serverstuff/server-hardware-configuration.nix
		./modules/searx.nix
		#./modules/serverstuff/nextcloud.nix
		#./modules/serverstuff/wireguard-server.nix
		#./modules/serverstuff/vaultwarden.nix
		./modules/serverstuff/blocky.nix
		#./modules/serverstuff/dashy.nix
	];
boot.loader = {
	grub.enable = false;
	generic-extlinux-compatible.enable = true;
};
	services.openssh = {
		enable = true;
	};
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./modules/home/server-home.nix;
    };
  };
	networking = {
		firewall = {
			enable = true;
			allowedTCPPorts = [
				8888
				80
				443
				53
			];
			allowedUDPPorts = [ 
				51820 
				53
			];
		};
		interfaces.wlp3s0.ipv4.addresses = [{
			address = "192.168.0.11";
			prefixLength = 24;
		}];
	};
}
