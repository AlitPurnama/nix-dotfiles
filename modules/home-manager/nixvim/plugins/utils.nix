{ config, lib, ... }:
with lib;
let cfg = config.utils;
in {
  options.utils.enable = mkEnableOption "Enable Utils Plugins";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      # Hardtime NVIM
      hardtime.enable = true;
      notify.enable = true;
      noice.enable = true;
      snacks = {
        enable = true;
        settings = {
          notifier.enabled = true;
          lazygit = {
            enabled = true;
            configure = true;
          };
        };
      };
    };
  };
}
