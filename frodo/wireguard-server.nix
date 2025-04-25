{ config, lib, ... }:
with lib;
{
  networking =
    let
      externalInterface = "end0";
      interface = "wg0";
      port = 21; # just an example
    in
    {
      wg-quick.interfaces.${interface} = {
        address = [ "100.64.0.1/24" ]; # this peer's address with subnet suffix
        listenPort = port;
        privateKeyFile = config.sops.secrets."wireguard-frodo-private".path; # never leave secrets in globally readable nix store
        mtu = 1280; # default is 1420, which is usually fine. however it can be problematic when using pppoe connection, gcp with dual stack, etc. i use 1280 to avoid future headaches.
        peers = [
          {
            publicKey = "pGF767vIiPiLsTf0V0AhtAqapGSb2xFZjE/TvZbGdh0=";
            allowedIPs = [
              "100.64.0.2/32"
              "0.0.0.0/0"
            ]; # note the 32 subnet suffix
            endpoint = "58.110.77.244:21";
          }
        ];
      };
      nat = {
        enable = true;
        inherit externalInterface;
        internalInterfaces = [ interface ];
      };
      nftables.tables.nat = {
        family = "inet";
        content = ''
          chain postrouting {
            type nat hook postrouting priority srcnat;
            iifname "${interface}" oifname "${externalInterface}" masquerade;
          }
        '';
      };
      firewall = {
        extraForwardRules = ''
          iifname "${interface}" accept;
        '';
        allowedUDPPorts = [
          port
        ];
      };
      networkmanager.unmanaged = [ "${interface}" ];
      # allow to connect using domain name `ssh user@phone.internal.yourdomain.com` instead of `ssh user@100.64.0.2`.
      # just an example. in real world, you should leverave your nix-fu and map this automatically with the help of concatStringsSep and map.
      /*
        extraHosts = ''
          100.64.0.2 phone.internal.yourdomain.com
        '';
      */
    };

}
