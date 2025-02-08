{ lib, pkgs }:
let
  serverList = {
    nixd.enable = true;
    lua_ls.enable = true;
  };
in {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = serverList;
    };
    lspsaga = {
      enable = true;
      lightbulb.enable = false;
    };
    otter.enable = true;
  };
  keymaps = [ ];
}
