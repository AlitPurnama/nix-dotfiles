{ lib, pkgs }:
with lib; {

  plugins.mini = {
    enable = true;
    modules = { icons.enabled = true; };
    mockDevIcons = true;
  };
  keymaps = [ ];
}
