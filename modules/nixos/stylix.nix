{ pkgs, ... }: {
  stylix.enable = true;
  stylix.image = ../../images/wallpapers/dragon.png;
  stylix.polarity = "dark";
  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.fonts = { sizes.terminal = 18; };
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

}
