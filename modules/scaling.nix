{ lib, ... }:
{
	scaling = lib.mkOption {
		default = 1;
		type = lib.types.int;
		description = ''
			Scaling; higher on higher res and lower on lower res
		'';
	};
}
