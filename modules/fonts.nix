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
		scaling = lib.mkOption {
			default = 1.0;
			type = lib.types.float;
			description = ''
				Scaling; higher on higher res and lower on lower res
			'';
		};
	};
}
