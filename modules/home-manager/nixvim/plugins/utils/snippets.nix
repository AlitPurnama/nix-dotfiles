{ lib, config, ... }:
with lib;
let cfg = config.snippets;
in {
  options.snippets.enable = mkEnableOption "Enable Snippet";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      luasnip.enable = true;
      friendly-snippets.enable = true;
    };
  };
}
