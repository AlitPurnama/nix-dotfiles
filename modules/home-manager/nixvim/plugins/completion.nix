{ lib, pkgs }:
let blinkSettings = { keymap = { preset = "super-tab"; }; };
in {
  plugins = {
    blink-cmp = {
      enable = true;
      settings = blinkSettings;
    };
    blink-compat.enable = true;
  };

  keymaps = [ ];
}
