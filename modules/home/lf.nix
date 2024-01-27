{ pkgs, ... }:
{
	xdg.configFile."lf/icons".source = ./lf-icons;
	programs.lf = {
		enable = true;
		settings = {
			preview = true;
			drawbox = true;
			icons = true;
			ignorecase = true;
		};
		commands = {
			mkdir = /* bash */ ''
				''${{
					printf "Directory Name: "
					read ans
					mkdir $ans
				}}
			'';
			mkfile = /* bash */ ''
				''${{
					printf "File Name: "
					read ans
					$EDITOR $ans
				}}
			'';
			open-editor = /* bash */ ''$$EDITOR $f'';
			unarchive = /* bash */ ''
				case "$f" in 
					*.zip) ${pkgs.unzip}/bin/unzip "$f" ;;
					*.tar.gz) ${pkgs.gnutar}/bin/tar -xzvf "$f";;
					*.tar.bz2) ${pkgs.gnutar}/bin/tar -xjvf "$f";;
					*.tar) ${pkgs.gnutar}/bin/tar -xvf "$f";;
					*.7z) ${pkgs.p7zip}/bin/7z e "$f";;
					*) echo "Unsupported format" ;;
			'';
		};
		keybindings = {
			"<enter>" = "open-editor";
			o = "mkfile";
			O = "mkdir";
			"." = "set hidden!";
			"gd" = "cd ~/Downloads";
			"gn" = "cd ~/nix";
			"au" = "unarchive";
		};
	};
}
