{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
		garf.url = "github:lenny0939/garf";
		nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kleur = {
      url = "github:suyashtnt/kleur";
    };
    impermanence.url = "github:nix-community/impermanence";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		niri.url = "github:sodiboo/niri-flake";
	  lix-module = {
				url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0-1.tar.gz";
				inputs.nixpkgs.follows = "nixpkgs";
			};   
			sops-nix.url = "github:Mic92/sops-nix";
		};
  outputs = {
    nixpkgs,
		lix-module,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      legolas = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;
          gui = true;
          laptop = true;
          desktop = false;
          games = true;
          server = false;
          vm = false;
          impermanence = false;
        };
        modules = [./configuration.nix];
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
          impermanence = false;
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
          impermanence = true;
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
          impermanence = false;
					vm = false;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
