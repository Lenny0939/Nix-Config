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
		hyprland.url = "github:hyprwm/Hyprland?ref=v0.34.0";
		plugin-code_runner = {
			url = "github:CRAG666/code_runner.nvim";
			flake = false;
		};
		nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = { self, nixos, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
				config = {
	  			allowUnfree = true;
				};
    	};
    in {
    	nixosConfigurations = {
      	laptop-no-distractions = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./laptop.nix
					];
  			};
      	laptop= nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./laptop.nix
						./steam.nix
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
	  				./laptop.nix
						./steam.nix
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
					];
  			};
	  	};
		};
}
