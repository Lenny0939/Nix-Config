My NixOS configuration
I have made the framework for configuring a server, though haven't actually put anything in it yet, so ignore anything about the server. There are multiple configurations managed by flakes, and each imports whatever files they need in the modules folder, and sometimes those files import there own. If you want to copy and paste, A. I use colemak, so make sure to revert that in modules/home/hyprland.nix, and B. I keep my hardware-configuration.nix's in here too, which will not work on any computer except mine.
