{ lib, ... }:
{
	options = {
		fontsize = lib.mkOption {
			default = 12;
			type = lib.types.int;
			description = ''
				fontsize, for larger sizes you can multiply it. This is just a base.
			'';
		};
		font = lib.mkOption {
			default = "Hack Nerd Font";
			type = lib.types.str;
			description = ''
				Font to use.
			'';
		};
	};
}
