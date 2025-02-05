{ config, lib, ... }:
with lib;
let cfg = config.java;
in {
  options.java.enable = mkEnableOption "Enable Java";
  config = mkIf cfg.enable {

  };
}
