{ inputs, config, pkgs, ... }:

{
	imports = [ ./searx.nix ];
	programs.hyprland = {
		enable = true;
		package = pkgs.hyprland.override {
			debug = true;
		};
	};
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home.nix;
    };
  };
  fonts.packages = with pkgs; [
		hack-font
		(nerdfonts.override { fonts = ["Hack"]; })
  ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd Hyprland";
        user = "lenny";
      };
			direct-hyprland = {
				command = "${pkgs.hyprland}/bin/Hyprland";
				user = "lenny";
			};
      default_session = initial_session;
    };
  };

  system.stateVersion = "24.05";
}
