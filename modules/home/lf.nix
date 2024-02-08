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
			trash = /* bash */ ''
			''${{
				${pkgs.trashy}/bin/trash "$f"
			}}
			'';
			restore-trash = /* bash */ ''
			''${{
				${pkgs.trashy}/bin/trash restore
			}}'';
			open-editor = /* bash */ ''$$EDITOR $f'';
			find-dir = /* bash */ ''$lf -remote "send $id cd $(${pkgs.fd}/bin/fd . ~ --type d | ${pkgs.fzf}/bin/fzf)"'';
			unarchive = /* bash */ '' 
			''${{
				case "$f" in 
					*.zip) ${pkgs.unzip}/bin/unzip "$f" ;;
					*.tar.gz) ${pkgs.gnutar}/bin/tar -xzvf "$f";;
					*.tar.bz2) ${pkgs.gnutar}/bin/tar -xjvf "$f";;
					*.tar) ${pkgs.gnutar}/bin/tar -xvf "$f";;
					*.7z) ${pkgs.p7zip}/bin/7z e "$f";;
					*) echo "Unsupported format" ;; 
				esac
			}}
			'';
		};
		keybindings = {
			"<enter>" = "open";
			o = "mkfile";
			O = "mkdir";
			"." = "set hidden!";
			"gd" = "cd ~/Downloads";
			"gn" = "cd ~/nix";
			"au" = "unarchive";
			d = "";
			x = "cut";
			y = "copy";
			"dd" = "trash";
			"dr" = "restore-trash";
			f = "find-dir";
		};
		extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "preview.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5
        
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --transfer-mode file --stdin no --place "''${w}x''${h}@''${x}x''${y}" "''$file" < /dev/null > /dev/tty
						#kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi
        
        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/preview.sh
    '';
	};
}
