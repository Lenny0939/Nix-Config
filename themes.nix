{ pkgs, ...}:
{
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
<<<<<<< HEAD
  #gtk.theme.package = pkgs.sweet;
  #gtk.theme.name = "sweet";
  #gtk.iconTheme.package = pkgs.papirus-icon-theme;
  #gtk.iconTheme.name = "Papirus";
=======
  gtk.theme.package = pkgs.sweet;
  gtk.theme.name = "sweet";
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus";
>>>>>>> pc
}
