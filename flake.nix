{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
  };

  /*outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lenny = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
  */
  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
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
      	laptop = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./laptop.nix
					];
  			};

				pc = nixpkgs.lib.nixosSystem {
        	specialArgs = { inherit inputs system; };
					modules = [
	  				./pc.nix
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
