{ inputs, pkgs, ... }:
{
	imports = [
    inputs.home-manager.nixosModules.home-manager
	];
	programs.zsh.enable = true;
	programs.neovim.enable = true;
	programs.neovim.defaultEditor = true;
  boot = {
	  loader = {
		  systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = null;
		};
    initrd.systemd.enable = true;
	};
  systemd.services.NetworkManager-wait-online.enable = false;
	powerManagement.enable = true;
	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 16*1024;
	}];
  users.defaultUserShell = pkgs.zsh;
  console = {
		earlySetup = true;
		keyMap = "colemak";
		font = "${pkgs.terminus_font}/share/consolefonts/ter-v32n.psf.gz";
		packages = with pkgs; [ terminus_font ];
	};
  security.rtkit.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking = {
	  networkmanager.enable = true;
	};
  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_AU.UTF-8";
  users.users.lenny = {
    isNormalUser = true;
    description = "Lenny";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
