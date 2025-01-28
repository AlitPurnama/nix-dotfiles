{ pkgs, inputs, ... }: {
  stylix.enable = true;
  stylix.image = ../../wallpapers/dragon.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

}
