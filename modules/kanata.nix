{ ... }:
{
	services.kanata = {
		keyboards = {
			laptop = {
				devices = [ ];
				config = ''
					(defsrc
					  grv  1    2    3    4    5    6    7    8    9    0    -    =
						tab  q    w    e    r    t    y    u    i    o    p    [    ]
						caps a    s    d    f    g    h    j    k    l    ;    '     
						lsft z    x    c    v    b    n    m    ,    .    /    rsft
						lctl lmet lalt           spc            ralt menu rctl
					)
					(deflayer qwerty
					  grv  1    2    3    4    5    6    7    8    9    0    -    =
						_    q    w    e    r    t    y    u    i    o    p     [    ]
						caps  a    s    d    f    g    h    j    k    l    ;    '
						_      z    x    c    v    b    n    m    ,    .    /    _
						_    _    _              _            _ @rcv _
					)
					(deflayer recurva
					  grv  1    2    3    4    5    6    7    8    9    0    -    =
						_    f    r    d    p    v    q    j    u    o    y     [    ]
					 C-bspc s    n    t    c    b    .    h    e    a    i    /
						_      x    k    g    w    z    m    l    ;    '    ,    _
						_    _    @alt              _            @* @qwr _
					)
					(deflayer nav 
						_    _    _    _    _    _    _    _    _    _    _    _    _
						_    _    _    _    _    _    _    _    _    _    _    _    _
						_    _    _    _    _    _    left down up  right _    _   
						_    _    _    _    _    _    _    _    _    _    _    _
						_    _    _              _              _    _    _
					)
					(defalias
						qwr (layer-switch qwerty)
						rcv (layer-switch recurva)
						nav (layer-while-held nav)
						alt (multi alt(layer-while-held qwerty))
					* (switch
							((key-history r 1)) n break
							((key-history u 1)) e break
							((key-history y 1)) , break
							() rpt break)
					)
				'';
			};
		};
	};
}
