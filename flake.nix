{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
		nix-colors.url = "github:misterio77/nix-colors";
		nixvim = {
			url = "github:nix-community/nixvim";
    	inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix.url = "github:Mic92/sops-nix";
  };
  outputs = { self, nixos, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    	nixosConfigurations = {
      	legolas = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./legolas/legolas.nix
					];
  			};
      	aragorn = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./aragorn/aragorn.nix
					];
  			};
				frodo = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./frodo/frodo.nix
					];
  			};

				live = nixos.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					system = "x86_64-linux";
					modules = [
						"${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
	  				./legolas/legolas.nix
						./iso.nix
					];
  			};
	  	};
		};
}
