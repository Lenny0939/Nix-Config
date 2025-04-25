{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../modules/nh.nix
  ];
  programs.zsh.enable = true;
  systemd.tmpfiles.settings = {
    "10-create-home" = {
      "/users/lenny/home" = {
        d = {
          group = "root";
          mode = "0700";
          user = "lenny";
        };
      };
    };
  };
  users.defaultUserShell = pkgs.zsh;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  powerManagement.enable = true;
  nix = {
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  console = {
    earlySetup = true;
  };
  security.rtkit.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  users.users.lenny = {
    isNormalUser = true;
    description = "Lenny";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    home = "/users/lenny";

    # This is required until this is merged:
    #   https://github.com/NixOS/nixpkgs/pull/324618
    # Reasoning in the PR
    homeMode = "0755";

    createHome = true;
  };
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
