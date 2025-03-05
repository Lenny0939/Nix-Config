{ inputs, pkgs, ... }: {
	imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
	nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
	nixpkgs.config.allowUnfree = true;
	services.minecraft-servers = {
		enable = true;
		eula = true;
		openFirewall = true;
		dataDir = "/var/lib/minecraft";
		servers.tennis-clan = {
			enable = true;
			package = pkgs.fabricServers.fabric-1_21_4;
			symlinks."mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/kLc5Oxr4/lithium-fabric-0.14.8%2Bmc1.21.4.jar"; sha256 = "tRIF9xDNCcY5scktZLxSG6bZD/pej0GVHspeo2kSFT0="; };
						Chunky = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fALzjamp/versions/VkAgASL1/Chunky-Fabric-1.4.27.jar"; sha256 = "A8kKcLIzQWvZZziUm+kJ0eytrHQ/fBVZQ18uQXN9Qf0="; };
						Fabric = pkgs.fetchurl { url= "https://cdn.modrinth.com/data/P7dR8mSH/versions/ZNwYCTsk/fabric-api-0.118.0%2B1.21.4.jar"; sha256 = "EDrLCs4eCeI4e8oe03vLVlYEESwRlhneCQ5vrjswPFM="; };
            FerriteCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/ULSumfl4/ferritecore-6.0.0-forge.jar"; sha256 = "Aej+nkvBWH5pLA0yrOcq/rKU1dXBo7eo2WRfgCuQYlU="; };
            Krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar"; sha256 = "lPGVgZsk5dpk7/3J2hXN2Eg2zHXo/w/QmLq2vC9J4/4="; };
						ModernFix = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/nmDcB62a/versions/ZGxQddYr/modernfix-fabric-5.20.3%2Bmc1.21.4.jar"; sha256 = "zrQ15ShzUtw1Xty1yxxO/n8xYofpaATSF9ewEeqE/d4="; };
            C2ME = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/VSNURh3q/versions/yGX4O0YU/c2me-fabric-mc1.21.4-0.3.1.1.0.jar"; sha256 = "eeKOKJVyKMIbd12/vRItWNMluCws7/3TikGmUwfd2/A="; };
          });
		};
	};	
}
