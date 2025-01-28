{ inputs, config, lib, ... }:with lib;
let
  cfg = config.hyprpanel;
in
{
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];
  options.hyprpanel.enable = mkEnableOption "Enable Hyprpanel";
  config = mkIf cfg.enable {
    programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
      hyprland.enable = true;
      theme = "catppuccin_macchiato_vivid";
      overlay.enable = true;
    };
  };
}
