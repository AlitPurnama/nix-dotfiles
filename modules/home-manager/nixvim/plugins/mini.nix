{ config, lib, ... }:
with lib;
let cfg = config.mini;
in {
  options.mini = { enable = mkEnableOption "Enable Mini"; };

  config = mkIf cfg.enable {
    programs.nixvim.plugins.mini = {
      enable = true;

    };
  };
}
