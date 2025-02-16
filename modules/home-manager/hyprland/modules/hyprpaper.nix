{ lib, config, ... }:
with lib;
let cfg = config.hyprpaper;
in {
  options.hyprpaper.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable hyprpaper services";
  };

  config = mkIf cfg.enable { services.hyprpaper = { enable = true; }; };
}
