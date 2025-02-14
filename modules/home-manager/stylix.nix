{ pkgs, ... }: {

  stylix.iconTheme = {
    enable = true;
    package = pkgs.catppuccin-papirus-folders;
    dark = "Papirus-Dark";
    light = "Papirus-Light";
  };
}
