{ pkgs, ... }: {
  stylix.enable = true;
  stylix.image = ../../images/wallpapers/grey_lain_wallpaper.jpg;
  stylix.polarity = "dark";
  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft";
  stylix.fonts = { sizes.terminal = 18; };
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  stylix.targets.plymouth.enable = false;
}
