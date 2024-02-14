{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
		#nixpkgs.url = "github:nixos/nixpkgs/master";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
		plugin-code_runner = {
			url = "github:CRAG666/code_runner.nvim";
			flake = false;
		};
		nix-colors.url = "github:misterio77/nix-colors";
		nixvim = {
			url = "github:nix-community/nixvim";
    	inputs.nixpkgs.follows = "nixpkgs";
		};
  };
  outputs = { self, nixos, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    	nixosConfigurations = {
      	laptop-no-distractions = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./laptop.nix
					];
  			};
      	laptop = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./laptop.nix
						./modules/distractions.nix
					];
  			};

				pc-no-distractions = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./pc.nix
					];
  			};

      	pc = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./pc.nix
						./modules/distractions.nix
					];
  			};
				server = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./server.nix
					];
  			};

				live = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
						(nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
	  				./laptop.nix
						./modules/distractions.nix
					];
  			};
	  	};
		};
}
