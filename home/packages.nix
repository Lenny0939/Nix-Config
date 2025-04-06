{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    /*
    Useless Rice Stuff
    */
    mangohud # Overlay, like MSI Afterburner
    dolphin-emu
    gh
    git
    godot_4
		reaper
    /*
    Utilities
    */
    zip
    unzip
    fd # lists files, needed for telescope and also cool finding thingo
    ripgrep # grep alternative
    fzf
    lsd
    ncdu
    bat
    nix-output-monitor
    /*
    Apps
    */
		vital
		distrho-ports
    spotify
    blanket
    bottom # Task manager except cool
    speedtest-cli
    acpi
    webcord
    pavucontrol
    yt-dlp
    audacity
    qmk
    prismlauncher
    libnotify
    hyprshot
    wl-clipboard
    nix-search-cli
    qmk
    brightnessctl
    easyeffects
    trashy
  ];
}
