{ inputs, pkgs, ... }: {
	imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
	nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
	nixpkgs.config.allowUnfree = true;
	services.minecraft-servers = {
		enable = true;
		eula = true;
		dataDir = "/var/lib/minecraft";
		servers = {
			chill-clan = {
				enable = true;
				package = pkgs.fabricServers.fabric-1_21_4;
				serverProperties = {
					server-port = 25564;
					difficulty = "hard";
					motd = "Season 1 | discord.gg/jDGaaAMzwA";
					online-mode = false;
					white-list = false;
				};
				symlinks."mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
					# Features
					SimpleVoiceChat = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/pl9FpaYJ/voicechat-fabric-1.21.4-2.5.26.jar"; sha256 = "2ni2tQjMCO3jaEA1OHXoonZpGqHGVlY/9rzVsijrxVA="; };
					LenientDeath = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Bfi1KBJV/versions/rxsQ1aP9/lenientdeath-1.2.5%2B1.21.2.jar"; sha256 = "KUveYV7trHhbf5dyeXvSyDcqnZOfX0sOC4S8NYepzhU="; };
					# Trading = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/x5iQ3NM5/versions/ImLX0SOZ/toms_trading_network-fabric-1.21.4-0.3.3.jar"; sha256 = "WC7Hr+YdzTpMS657F0YCunckZ/heAaUzsQbiZGSVACw="; };
					Appleskin = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/cHQjeYVS/appleskin-fabric-mc1.21.3-3.0.6.jar"; sha256 = "+PYRdG34jxc3tip2YVo2b0KjMXMOoW25fFLW9VQMWKs="; };
					DistantHorizons = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uCdwusMi/versions/DTFSZmMF/DistantHorizons-neoforge-fabric-2.3.0-b-1.21.4.jar"; sha256 = "FqV3dvw8VD4DM+b7cP49/zeh2jUtyQmkDtodQQLt948="; };
					# Anti cheat
					EasyAuth = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/aZj58GfX/versions/ZAl3Kcyc/easyauth-mc1.21.2-3.1.10.jar"; sha256 = "qHJipM0RJn6C9G0ZcgRS+izh9xeN8gC6nFkx0pLx5O0="; };
					AntiXRay = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/sml2FMaA/versions/dwTZzfS4/antixray-fabric-1.4.9%2B1.21.4.jar"; sha256 = "zv1giJdIOZSRnvxo4fLulT7UkTnDspE4CMNpRmn7rSY="; };
					# Vanish = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/UL4bJFDY/versions/sOVWUHwB/vanish-1.5.12%2B1.21.4.jar"; sha256 = "kDswxMVQv0mWfA2VEOMEGlaFZZzKjIH2jqO4i5OEt7g="; };
					InvView = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/jrDKjZP7/versions/LNGVFn7g/InvView-1.4.15-1.20.5%2B.jar"; sha256 = "fsEUjewyHKVg/0RJcpTdl0ClWSRj3ApU8Qv+AxIFZJE="; };
					# AntiCheat = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ljWczies/versions/t8qBSQVb/InertiaAntiCheat-1.0.4.2.jar"; sha256 = "p8j65PwxxbAwcvVm97JtsOvpuw2eltsmEPcloF08948="; };

					# Performance
					Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/kLc5Oxr4/lithium-fabric-0.14.8%2Bmc1.21.4.jar"; sha256 = "tRIF9xDNCcY5scktZLxSG6bZD/pej0GVHspeo2kSFT0="; };
					Chunky = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fALzjamp/versions/VkAgASL1/Chunky-Fabric-1.4.27.jar"; sha256 = "A8kKcLIzQWvZZziUm+kJ0eytrHQ/fBVZQ18uQXN9Qf0="; };
					Fabric = pkgs.fetchurl { url= "https://cdn.modrinth.com/data/P7dR8mSH/versions/ZNwYCTsk/fabric-api-0.118.0%2B1.21.4.jar"; sha256 = "EDrLCs4eCeI4e8oe03vLVlYEESwRlhneCQ5vrjswPFM="; };
					FerriteCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/ULSumfl4/ferritecore-6.0.0-forge.jar"; sha256 = "Aej+nkvBWH5pLA0yrOcq/rKU1dXBo7eo2WRfgCuQYlU="; };
					Krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar"; sha256 = "lPGVgZsk5dpk7/3J2hXN2Eg2zHXo/w/QmLq2vC9J4/4="; };
					ModernFix = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/nmDcB62a/versions/ZGxQddYr/modernfix-fabric-5.20.3%2Bmc1.21.4.jar"; sha256 = "zrQ15ShzUtw1Xty1yxxO/n8xYofpaATSF9ewEeqE/d4="; };
					C2ME = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/VSNURh3q/versions/yGX4O0YU/c2me-fabric-mc1.21.4-0.3.1.1.0.jar"; sha256 = "eeKOKJVyKMIbd12/vRItWNMluCws7/3TikGmUwfd2/A="; };
					Noisium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/9NHdQfkN/noisium-fabric-2.5.0%2Bmc1.21.4.jar"; sha256 = "JmSbfF3IDaC1BifR8WaKFCpam6nHlBWQzVryDR6Wvto="; };
					Spark = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/l6YH9Als/versions/X2sypdTL/spark-1.10.121-fabric.jar"; sha256 = "E1BDAk8b1YBuhdqLK98Vh4xVmL99qs5dEwI2/wCbt28="; };
					ServerCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/4WWQxlQP/versions/uJYh4tBK/servercore-fabric-1.5.8%2B1.21.4.jar"; sha256 = "fC6fTqt88WkGrpU8caWno9TapUYHnh8D06A6dzS2hVE="; };
				});
				jvmOpts = "-Xms3G -Xmx3G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true";
			};
			new-clan = {
				enable = true;
				package = pkgs.fabricServers.fabric-1_21_4;
				serverProperties = {
					server-port = 25566;
					difficulty = "hard";
					motd = "Arvion ♥";
					online-mode = false;
					white-list = true;
				};
				symlinks."mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
					# Features
					SimpleVoiceChat = pkgs.fetchure { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/pl9FpaYJ/voicechat-fabric-1.21.4-2.5.26.jar"; sha256 = "2ni2tQjMCO3jaEA1OHXoonZpGqHGVlY/9rzVsijrxVA="; };
					LenientDeath = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Bfi1KBJV/versions/rxsQ1aP9/lenientdeath-1.2.5%2B1.21.2.jar"; sha256 = "KUveYV7trHhbf5dyeXvSyDcqnZOfX0sOC4S8NYepzhU="; };
					Factions = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ZjwW8Q6n/versions/sKyOcfhJ/factions-mc1.21.4-2.7.2.jar"; sha256 = "FNpfQigg0ir/VqG3v6QWnet4EYhIdJITVREu0+pgmSQ="; };
					# Trading = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/x5iQ3NM5/versions/ImLX0SOZ/toms_trading_network-fabric-1.21.4-0.3.3.jar"; sha256 = "WC7Hr+YdzTpMS657F0YCunckZ/heAaUzsQbiZGSVACw="; };
					Appleskin = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/cHQjeYVS/appleskin-fabric-mc1.21.3-3.0.6.jar"; sha256 = "+PYRdG34jxc3tip2YVo2b0KjMXMOoW25fFLW9VQMWKs="; };
					DistantHorizons = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uCdwusMi/versions/DTFSZmMF/DistantHorizons-neoforge-fabric-2.3.0-b-1.21.4.jar"; sha256 = "FqV3dvw8VD4DM+b7cP49/zeh2jUtyQmkDtodQQLt948="; };
					# Anti cheat
					EasyAuth = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/aZj58GfX/versions/ZAl3Kcyc/easyauth-mc1.21.2-3.1.10.jar"; sha256 = "qHJipM0RJn6C9G0ZcgRS+izh9xeN8gC6nFkx0pLx5O0="; };
					AntiXRay = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/sml2FMaA/versions/dwTZzfS4/antixray-fabric-1.4.9%2B1.21.4.jar"; sha256 = "zv1giJdIOZSRnvxo4fLulT7UkTnDspE4CMNpRmn7rSY="; };
					Vanish = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/UL4bJFDY/versions/sOVWUHwB/vanish-1.5.12%2B1.21.4.jar"; sha256 = "kDswxMVQv0mWfA2VEOMEGlaFZZzKjIH2jqO4i5OEt7g="; };
					InvView = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/jrDKjZP7/versions/LNGVFn7g/InvView-1.4.15-1.20.5%2B.jar"; sha256 = "fsEUjewyHKVg/0RJcpTdl0ClWSRj3ApU8Qv+AxIFZJE="; };
					# AntiCheat = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ljWczies/versions/t8qBSQVb/InertiaAntiCheat-1.0.4.2.jar"; sha256 = "p8j65PwxxbAwcvVm97JtsOvpuw2eltsmEPcloF08948="; };
					# Performance
					Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/kLc5Oxr4/lithium-fabric-0.14.8%2Bmc1.21.4.jar"; sha256 = "tRIF9xDNCcY5scktZLxSG6bZD/pej0GVHspeo2kSFT0="; };
					Chunky = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fALzjamp/versions/VkAgASL1/Chunky-Fabric-1.4.27.jar"; sha256 = "A8kKcLIzQWvZZziUm+kJ0eytrHQ/fBVZQ18uQXN9Qf0="; };
					Fabric = pkgs.fetchurl { url= "https://cdn.modrinth.com/data/P7dR8mSH/versions/ZNwYCTsk/fabric-api-0.118.0%2B1.21.4.jar"; sha256 = "EDrLCs4eCeI4e8oe03vLVlYEESwRlhneCQ5vrjswPFM="; };
					FerriteCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/ULSumfl4/ferritecore-6.0.0-forge.jar"; sha256 = "Aej+nkvBWH5pLA0yrOcq/rKU1dXBo7eo2WRfgCuQYlU="; };
					Krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar"; sha256 = "lPGVgZsk5dpk7/3J2hXN2Eg2zHXo/w/QmLq2vC9J4/4="; };
					ModernFix = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/nmDcB62a/versions/ZGxQddYr/modernfix-fabric-5.20.3%2Bmc1.21.4.jar"; sha256 = "zrQ15ShzUtw1Xty1yxxO/n8xYofpaATSF9ewEeqE/d4="; };
					C2ME = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/VSNURh3q/versions/yGX4O0YU/c2me-fabric-mc1.21.4-0.3.1.1.0.jar"; sha256 = "eeKOKJVyKMIbd12/vRItWNMluCws7/3TikGmUwfd2/A="; };
					Noisium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/9NHdQfkN/noisium-fabric-2.5.0%2Bmc1.21.4.jar"; sha256 = "JmSbfF3IDaC1BifR8WaKFCpam6nHlBWQzVryDR6Wvto="; };
					Spark = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/l6YH9Als/versions/X2sypdTL/spark-1.10.121-fabric.jar"; sha256 = "E1BDAk8b1YBuhdqLK98Vh4xVmL99qs5dEwI2/wCbt28="; };
					ServerCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/4WWQxlQP/versions/uJYh4tBK/servercore-fabric-1.5.8%2B1.21.4.jar"; sha256 = "fC6fTqt88WkGrpU8caWno9TapUYHnh8D06A6dzS2hVE="; };
				});
				jvmOpts = "-Xms3G -Xmx3G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true";
			};
		};
	};	
services.haproxy = {
  enable = true;
  config = ''
global
  log stderr format iso local7
defaults
  mode tcp
  log global
  option tcplog
  maxconn 20000
  timeout client 200s
  timeout server 200s
  timeout connect 20s
frontend minecraft-frontend
  bind *:25565
  tcp-request inspect-delay 5s
  acl craft req.payload(5,16),lower -m sub mc.lench.org
  tcp-request content accept if craft
  use_backend craft if craft
  acl other-craft req.payload(5,16),lower -m sub new.lench.org
  tcp-request content accept if other-craft
  use_backend other-craft if other-craft
backend craft
   server craft-server 0.0.0.0:25566 check
backend other-craft
   server craft-server 0.0.0.0:25564 check
  '';
};
}
