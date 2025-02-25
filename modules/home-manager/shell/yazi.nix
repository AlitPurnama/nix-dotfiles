{ pkgs, lib, config, inputs, ... }:
with lib;
let cfg = config.yazi;
in {
  options.yazi.enable = mkEnableOption "Enable Yazi";
  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      package = inputs.yazi.packages.${pkgs.system}.default;
      settings = { };
    };
  };
}
