{ config, lib, ... }:
with lib;
let cfg = config.formatters;
in {
  options.formatters.enable = mkEnableOption "Enable Formatters";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources.formatting = { nixfmt.enable = true; };
      };
      lsp-format.enable = true;
    };
  };
}
