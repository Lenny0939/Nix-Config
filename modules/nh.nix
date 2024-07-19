{ ... }:
{
	programs.nh = {
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/users/lenny/nix";
	};
}
