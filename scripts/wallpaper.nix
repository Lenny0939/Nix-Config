{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "wallpaper"
      # sh
      ''
        MONITOR=$(hyprctl monitors -j | ${jq}/bin/jq -r '.[] | .name')
        WALLPAPER=$(${fd}/bin/fd . ${../wallpapers} | ${fzf}/bin/fzf --delimiter / --with-nth -1 --preview='${kitty}/bin/kitten icat --clear --transfer-mode=memory --stdin=no --place="$(($COLUMNS/2))"x"$(($LINES))"@"$(($COLUMNS/2))"x0 --align center {} > /dev/tty')
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
      ''
    )
  ];
}
