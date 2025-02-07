{ lib, pkgs }:
with lib;
let
in {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers.nixd.enable = true;
    };
    lspsaga = {
      enable = true;
      lightbulb.enable = false;
    };
    otter.enable = true;
  };
  keymaps = [ ];
}
