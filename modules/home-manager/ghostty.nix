{ lib, config, inputs, ... }:with lib;
let
  cfg = config.ghostty;
in
{
  options.ghostty.enable = mkEnableOption "Enable Ghostty";
  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.x86_64-linux.default;
    };
  };
}
