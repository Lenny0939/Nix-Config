{ ... }:
{
	#services.kanata = {
	services.keyd = {
		enable = true;
		keyboards = {
			laptop = {
				/* devices = [
					"/dev/input/event0"
				];
				config = ''
					(defsrc
						grv   1    2    3    4    5    6    7    8    9    0    -    =    caps
						tab   q    w    f    p    g    j    l    u    y    ;    [    ]    \
						bspc  a    r    s    t    d		 h    n    e    i    o    '    ret
						lsft  z    x    c    v    b    k    m    ,    .    /    rsft
						lctl  lmet  lalt          spc            @lwr rmet rctl)

					(deflayermap (lower)
						n : left
						e : down
						i : up
						o : right
						spc : ret
						bspc : cap) 

				  (defalias
						lwr (layer-while-held lower))
				''; */
				settings = {
					main = {
						capslock = "backspace";
					};
					global = {
						default_layout = "colemak";
					};
					"colemak:layout" = {
						e = "f";
						r = "p";
						t = "g";
						y = "j";
						u = "l";
						i = "u";
						o = "y";
						p = "semicolon";
						s = "r";
						d = "s";
						f = "t";
						g = "d";
						j = "n";
						k = "e";
						l = "i";
						semicolon = "o";
						n = "k";
					};
					rightalt = {
						h = "left";
						j = "down";
						k = "up";
						l = "right";
					};
				};
			};
		};
	};
}	
