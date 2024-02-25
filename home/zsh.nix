{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#$(hostname -s)";
			detnsw = "${pkgs.networkmanager}/bin/nmcli --ask con up detnsw";
			wifi = ''${pkgs.networkmanager}/bin/nmcli --ask dev wifi connect $(${pkgs.networkmanager}/bin/nmcli --ask dev wifi list | ${pkgs.coreutils}/bin/tail -n +2 | ${pkgs.gnused}/bin/sed 's/\*//g' | ${pkgs.gawk}/bin/awk '{ print $2" "$5" "$6" "$7 "%" }' | ${pkgs.fzf}/bin/fzf | ${pkgs.gawk}/bin/awk '{ print $1 }')'';
      test = "sudo nixos-rebuild test --flake ~/nix#$(hostname -s)";
			ff = "$EDITOR $(${pkgs.fzf}/bin/fzf)";
			gyat = "git";
    };
    plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.4.0";
        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      };
    }
    {
      name = "fast-syntax-highlighting";
      file = "fast-syntax-highlighting.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "zdharma";
        repo = "fast-syntax-highlighting";
        rev = "5fab542516579bdea5cc8b94137d9d85a0c3fda5";
        sha256 = "1ff1z2snbl9rx3mrcjbamlvc21fh9l32zi2hh9vcgcwbjwn5kikg";
      };
    }
		/*{
			name = "zsh-vi-mode";
			src = pkgs.fetchFromGitHub {
				owner = "jeffreytse";
				repo = "zsh-vi-mode";
				rev = "v0.11.0";
				sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
			};
		}*/
    ];
		/*initExtra = ''
			source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
		'';
		*/
		initExtra = "fastfetch";
  };  
	programs.zoxide.enable = true;
	programs.starship = {
    enable = true;
    #settings = pkgs.lib.importTOML ./starship.toml;
  };
}
