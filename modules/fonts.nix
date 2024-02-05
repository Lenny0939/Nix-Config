{ lib, ... }:
{
	options = {
		font = lib.mkOption {
			default = "Hack Nerd Font";
			type = lib.types.str;
			description = ''
				Font to use.
			'';
		};
	};
}
