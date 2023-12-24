{ inputs, config, pkgs, lib, ... }:
{
	imports = [
		./server-hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
	];
	home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      lenny = import ./server-home.nix;
    };
  };
  programs.zsh.enable = true;
	programs.neovim.enable = true;
	programs.neovim.defaultEditor = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.plymouth.enable = true;
  #boot.plymouth.theme = "breeze";
  boot.initrd.systemd.enable = true;
  boot.loader.timeout = null;
	networking.hostName = "lennys-server";
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
	};
  security.rtkit.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.networkmanager.enable = true;
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
