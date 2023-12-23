{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nix";
      detnsw = "nmcli --ask con up detnsw";
      wifi = "nmcli --ask dev wifi connect";
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
    ];
  };
}
