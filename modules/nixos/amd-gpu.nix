{ config, lib, ... }:
with lib;
let cfg = config.use-amd-gpu;
in {
  options.use-amd-gpu = mkEnableOption "Are you using amd gpu?";
  config = mkIf cfg {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    boot.kernelParams = [ ];

    # I use rx 580
    environment.variables = { ROC_ENABLE_PRE_VEGA = "1"; };
  };
}
