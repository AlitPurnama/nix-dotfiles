{ lib, pkgs }:
with lib; {

  plugins = {
    luasnip.enable = true;
    friendly-snippets.enable = true;
  };

  keymaps = [ ];
}
