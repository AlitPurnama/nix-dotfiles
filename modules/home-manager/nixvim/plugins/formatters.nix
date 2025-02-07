{ lib, pkgs }:
with lib;
let sourcesFormat = { nixfmt.enable = true; };
in {
  plugins = {
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources.formatting = sourcesFormat;
    };
    lsp-format.enable = true;
  };
  keymaps = [ ];
}
