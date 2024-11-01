{pkgs, ...}: {
  environment.etc."nextcloud-admin-pass".text = "password";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    config.adminpassFile = "path to secrets";
  };
}
