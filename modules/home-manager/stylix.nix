{ pkgs, ... }: {

  stylix.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.catppuccin-papirus-folders;
    dark = "Papirus-Dark";
    light = "Papirus-Light";
  };
}
