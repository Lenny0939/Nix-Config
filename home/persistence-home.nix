{ ... }:
{
	home.persistence."/persist/users" = {
		directories = [
			"home"
			"steam"
			"nix-config"
		];
		files = [
			"zsh_history"
		];
		allowOther = true;
	};
}
