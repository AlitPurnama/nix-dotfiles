{ pkgs, config, lib, ... }:
with lib;
let cfg = config.atuin;
in {
  options.atuin.enable = mkEnableOption "Enable Atuin";
  config = mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        secrets_filter = true;
        history_filter = [ "^rm(s+.*)?$" "^mv(s+.*)?$" ];
      };
    };
  };
}
