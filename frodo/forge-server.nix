{ pkgs, ... }:
let
  version = "1.20.1-47.4.0";
	vanilla = pkgs.minecraftServers.vanilla-1_20;
  installer = pkgs.fetchurl {
    pname = "forge-installer";
    inherit version;
    url = "https://maven.minecraftforge.net/net/minecraftforge/forge/${version}/forge-${version}-installer.jar";
    hash = "sha256-8/V0ZeLL3DKBk/d7p/DJTLZEBfMe1VZ1PZJ16L3Abiw=";
  };
  java = "${pkgs.jdk17_headless}/bin/java";

in
pkgs.writeShellScriptBin "server" ''
	echo "eula=true" > eula.txt
	if ! [ -f "server.jar" ]; then 
		cp ${vanilla.src} server.jar
    ${java} -jar ${installer} --installServer
	fi
	exec ${java} "$@" @libraries/net/minecraftforge/forge/1.20.1-47.4.0/unix_args.txt
''
