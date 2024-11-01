{
  pkgs,
  inputs,
  ...
}: {
  gtk = {
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus";
  };
  stylix = {
    image = ../wallpapers/valley.png;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    #base16Scheme = inputs.kleur.themes.${pkgs.system}.dark.base16;
    opacity.terminal = 0.8;
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
        name = "Iosevka Nerd Font";
        /*
           package = (pkgs.iosevka.override {
        	privateBuildPlan = {
        		family = "Iosevka Custom";
        	 spacing = "normal";
        	 serifs = "sans";

        	 variants = {
        		 design.capital-j = "serifless";
        		 italic.i = "tailed";
        	 };
         };
        });
        name = "Iosevka Custom";
        */
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
  blur = false;
}
