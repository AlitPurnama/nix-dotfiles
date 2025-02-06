{ config, lib, ... }:
with lib;
let cfg = config.utils;
in {
  imports = [ ./mini.nix ./snacks.nix ./snippets.nix ];
  options.utils.enable = mkEnableOption "Enable Utils Plugins";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      # Hardtime NVIM
      hardtime.enable = true;
      notify.enable = true;
      noice.enable = true;
    };
  };
}
