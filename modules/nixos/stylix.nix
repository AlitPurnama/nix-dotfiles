{ pkgs, ... }: {
  stylix.enable = true;
  stylix.image = ../../images/wallpapers/wallhaven-wexo5q.png;
  stylix.polarity = "light";
  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/tokyo-city-light.yaml";
  stylix.fonts = { sizes.terminal = 18; };
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  stylix.targets.plymouth.enable = false;
}
