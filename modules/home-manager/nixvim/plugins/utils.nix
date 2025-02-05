{ config, lib, ... }:
with lib;
let cfg = config.utils;
in {
  options.utils.enable = mkEnableOption "Enable Utils Plugins";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      # Hardtime NVIM
      hardtime.enable = true;
    };
  };
}
