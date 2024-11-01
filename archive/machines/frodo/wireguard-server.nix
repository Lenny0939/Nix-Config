{pkgs, ...}: {
  networking = {
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = ["wg0"];
    };
    wireguard.interfaces = {
      wg0 = {
        ips = ["10.100.0.1/24"];
        listenPort = 51820;
        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o
        '';
        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o
        '';
        privateKeyFile = "secret";
        peers = [
          {
            /*
            CHANGE THIS!!!
            */
            publicKey = "{password}";
            allowedIPs = ["10.100.0.2/32"];
          }
        ];
      };
    };
  };
}
