{ inputs, pkgs, ... }:

{
	imports = [ 
		./searx.nix
		./all.nix
	];

	programs.hyprland = {
		enable = true;
	};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./home/home.nix;
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
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd Hyprland";
				command = "${pkgs.hyprland}/bin/Hyprland";
        user = "lenny";
      };
			default_session = initial_session;
    };
  };

  system.stateVersion = "24.05";
}
