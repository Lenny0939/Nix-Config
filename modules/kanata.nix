{ ... }:
{
	services.kanata = {
		enable = true;
		keyboards = {
			laptop = {
				devices = [ ];
				config = ''
					(defsrc
						tab  q    w    e    r    t    y    u    i    o    p 
						caps a    s    d    f    g    h    j    k    l    ;    '    
						lsft z    x    c    v    b    n    m    ,    .    /    rsft
						lctl lmet lalt           spc            ralt menu rctl
					)
					(deflayer canary
						tab  w    l    y    p    k    z    x    o    u    ;
						bspc  c    r    s    t    b    f    n    e    i    a    '
						lsft   j    v    d    g    q    m    h    /    ,    .    rsft
						lctl @nav @alt           spc            ralt @qwr rctl
					)
					(deflayer qwerty
						_    q    w    e    r    t    y    u    i    o    p
						caps  a    s    d    f    g    h    j    k    l    ;    '
						_      z    x    c    v    b    n    m    ,    .    /    _
						_    _    _              _            _ @rcv _
					)
					(deflayer recurva
						_    f    r    d    p    v    q    j    u    o    y
						bspc  s    n    t    c    b    .    h    e    a    i    /
						_      x    k    g    w    z    m    l    ;    '    ,    _
						_    _    _              _            rpt @cny _
					)
					(deflayer nav 
						_    _    _    _    _    _    _    _    _    _    _
						_    _    _    _    _    _    left down up  right _    _   
						_    _    _    _    _    _    _    _    _    _    _    _
						_    _    _              _              _    _    _
					)
					(defalias
						cny (layer-switch canary)
						qwr (layer-switch qwerty)
						rcv (layer-switch recurva)
						nav (layer-while-held nav)
						alt (multi alt(layer-while-held qwerty))
					)
				'';
			};
		};
	};
}
