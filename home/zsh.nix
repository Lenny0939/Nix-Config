{ pkgs, ... }:
let
	configDir = "/home/lenny/nix";
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ${configDir}#$(${pkgs.hostname}/bin/hostname)";
      test = "sudo nixos-rebuild test --flake ${configDir}#$(${pkgs.hostname}/bin/hostname)";
			detnsw = "${pkgs.networkmanager}/bin/nmcli --ask con up detnsw";
			wifi = ''${pkgs.networkmanager}/bin/nmcli --ask dev wifi connect $(${pkgs.networkmanager}/bin/nmcli --ask dev wifi list | ${pkgs.coreutils}/bin/tail -n +2 | ${pkgs.gnused}/bin/sed 's/\*//g' | ${pkgs.gawk}/bin/awk '{ print $2" "$5" "$6" "$7 "%" }' | ${pkgs.fzf}/bin/fzf | ${pkgs.gawk}/bin/awk '{ print $1 }')'';
			ff = "${pkgs.fzf}/bin/fzf --bind 'enter:become($EDITOR {})'";
			clean = "nix-collect-garbage -d && sudo nix-collect-garbage -d && sudo nix-store --optimise";
			upgrade = "nix flake update ${./..}";
			gyat = "git";
			cd = "z";
			ls = "lsd";
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
      name = "syntax-highlighting";
			file = "zsh-syntax-highlighting.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "master";
        sha256 = "sha256-4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
      };
    }
    {
      name = "zsh-vi-mode";
      src = pkgs.fetchFromGitHub {
        owner = "jeffreytse";
        repo = "zsh-vi-mode";
        rev = "v0.11.0";
        sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
      };
    }
    ];
		initExtra = ''
			source "$(fzf-share)/key-bindings.zsh"
			source "$(fzf-share)/completion.zsh"
			fastfetch
		'';
  };  
	programs.zoxide.enable = true;
	programs.starship = {
    enable = true;
    #settings = pkgs.lib.importTOML ./starship.toml;
  };
	home.sessionVariables = {
		FZF_DEFAULT_COMMAND = "fd --type f";
		FZF_DEFAULT_OPTS = "--layout=reverse --inline-info --preview '${pkgs.pistol}/bin/pistol {}'";
	};
}
