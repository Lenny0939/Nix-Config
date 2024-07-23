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
					};
					modules = [
						./configuration.nix
						./modules/options.nix
						inputs.home-manager.nixosModules.home-manager
						{ 
							home-manager = {
								extraSpecialArgs = specialArgs; 
								users = {
									lenny = import ./home/home.nix;
								};
							};
						}
					];
  			};
      	aragorn = nixpkgs.lib.nixosSystem {
        	specialArgs = { 
						inherit inputs system; 
						gui = true;
						laptop = false;
						desktop = true;
						games = true;
						server = false;
					};
					modules = [
	  				./machines/aragorn/aragorn.nix
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

				palintir = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
						./machines/palintir/palintir.nix
					];
  			};
	  	};
		};
}
