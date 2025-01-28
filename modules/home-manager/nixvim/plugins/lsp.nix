{ lib, config, ... }:
with lib;
let cfg = config.lsp;
in {
  options.lsp.enable = mkEnableOption "Enable LSP";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = { nixd.enable = true; };
      };
      lspsaga = {
        enable = true;
        lightbulb.enable = false;
      };
    };
  };
}
