{ lib, ... }:
with lib;
let cfg = config.starship;
in {
  options.starship.enable = mkOption {
    type = types.bool;
    default = true;
  };
  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
