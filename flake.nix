{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix.url = "github:danth/stylix";
		nixvim = {
			url = "github:nix-community/nixvim";
    	inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix.url = "github:Mic92/sops-nix";
  };
  outputs = { self, nixos, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    	nixosConfigurations = {
      	legolas = nixpkgs.lib.nixosSystem rec {
        	specialArgs = { 
						inherit inputs system; 
						gui = true;
						laptop = true;
						desktop = false;
						games = true;
						server = false;
						vm = false;
					};
					modules = [ ./configuration.nix ];
  			};
      	aragorn = nixpkgs.lib.nixosSystem {
        	specialArgs = { 
						inherit inputs system; 
						gui = true;
						laptop = false;
						desktop = true;
						games = true;
						server = false;
						vm = false;
					};
					modules = [
	  				./configuration.nix
					];
				};
      	vm = nixpkgs.lib.nixosSystem {
        	specialArgs = { 
						inherit inputs system; 
						gui = false;
						laptop = false;
						desktop = false;
						games = false;
						server = false;
						vm = true;
					};
					modules = [
	  				./configuration.nix
					];
  			};
				frodo = nixpkgs.lib.nixosSystem {
        	specialArgs = { 
						inherit inputs system;
						gui = false;
						laptop = false;
						desktop = false;
						games = false;
						server = true;
					};
					modules = [
	  				./machines/frodo/frodo.nix
					];
  			};
	  	};
		};
}
