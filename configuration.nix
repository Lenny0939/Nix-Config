{ inputs, pkgs, ... }:
{
	imports = [
    inputs.home-manager.nixosModules.home-manager
		#./modules/sops.nix
	];
	programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
	programs.neovim.enable = true;
	programs.neovim.defaultEditor = true;
  systemd.services.NetworkManager-wait-online.enable = false;
	powerManagement.enable = true;
	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 16*1024;
	}];
	nix = { 
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 30d";
		};
		optimise = {
			automatic = true;
			dates = ["weekly"];
		};
	};
  console = {
		earlySetup = true;
		keyMap = "colemak";
		font = "${pkgs.terminus_font}/share/consolefonts/ter-i32b.psf.gz";
		packages = with pkgs; [ terminus_font ];
	};
  security.rtkit.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  users.users.lenny = {
    isNormalUser = true;
    description = "Lenny";
    extraGroups = [ "networkmanager" "wheel" ];
  };
	networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
