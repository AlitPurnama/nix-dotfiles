{ lib, pkgs }: {

  plugins.mini = {
    enable = true;
    modules = { icons.enabled = true; };
    mockDevIcons = true;
  };
  keymaps = [ ];
}
