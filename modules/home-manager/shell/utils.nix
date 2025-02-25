{ config, lib, ... }:
with lib;
let cfg = config.shell;
in {
  options.shell = {
    enable = mkEnableOption "Enable Config";
    enableZoxide = mkOption {
      type = types.bool;
      default = true;
    };
  };
  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = cfg.enableZoxide;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
