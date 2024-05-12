{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
		stylix.url = "github:danth/stylix";
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
	  				./machines/legolas/legolas.nix
					];
  			};
      	aragorn = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./machines/aragorn/aragorn.nix
					];
  			};
				frodo = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
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
