{ pkgs, ... }: {

  stylix.iconTheme = {
    enable = true;
    package = pkgs.flat-remix-icon-theme;
    dark = "Papirus-Dark";
    light = "Papirus-Light";
  };
}
