{config, pkgs, ...}: {
  networking = {
    hostName = "frodo";
    firewall = {
      enable = true;
      allowedTCPPorts = [
				# http
        80
        443
				# blocky
        53
        23
				# minecraft
				25565
				25564
      ];
      allowedUDPPorts = [
        51820
        53
				# minecraft voice chat 
				24454
      ];
    };
    interfaces.wlp3s0.ipv4.addresses = [
      {
        address = "192.168.0.154";
        prefixLength = 24;
      }
    ];
  };
	security.acme = {
    acceptTerms = true;
    #defaults.email = "${config.sops.secrets."email"}";
		defaults.email = "lennyescott@gmail.com";
		certs."lench.org" = {
			dnsProvider = "desec";
			environmentFile = "${pkgs.writeText "desec-creds" ''
				DESEC_TOKEN_FILE=${config.sops.secrets."desec-token".path}
			''}";
		};
  };
services.nginx = {
	enable = false;
	recommendedProxySettings = true;
	recommendedTlsSettings = true;
	virtualHosts = let
    SSL = {
      enableACME = true;
      forceSSL = true;
    }; in {
      "photos.lench.org" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:2342/";
      });
      "search.lench.org" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8888/";
      });
    };
	};
}
