My NixOS configuration
=====================
# Server
I have made the framework for configuring a server, though haven't actually put anything in it yet, so ignore anything about the server.
# How to implement
For the first time, run
```
$ git clone https://github.com/Lenny0939/nix-config.git
$ cd nix-config
$ sudo nixos-rebuild switch --flake .#pc //or any other config you want to use
```
After that, it will change your hostname and running ```$ rebuild''' will rebuild the configuration
To rebuild with no distractions, run ```$ sudo nixos-rebiuld switch --flake .#pc-no-distractions //or laptop
# Multiple Configurations
There are multiple configurations managed by flakes, and each imports whatever files they need in the modules folder, and sometimes those files import other files. There is laptop, pc, and server, and distraction-free variants of the first two.
# Warning
If you want to copy and paste my configuration, two things. A. I use colemak, so make sure to revert that in modules/home/hyprland.nix, and B. I keep my hardware-configuration.nix's in here too, which will not work on any computer except mine.
