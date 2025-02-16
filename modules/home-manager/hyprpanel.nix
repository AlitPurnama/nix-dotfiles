{ inputs, config, lib, ... }:
with lib;
let cfg = config.hyprpanel;
in {
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  options.hyprpanel.enable = mkEnableOption "Enable Hyprpanel";
  config = mkIf cfg.enable {
    programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
      hyprland.enable = true;
      theme = "catppuccin_macchiato_vivid";
      overlay.enable = true;

      layout = {
        "bar.layouts" = {
          "0" = {
            left = [ "dashboard" "workspaces" "windowtitle" ];
            middle = [ "media" ];
            right = [ "volume" "network" "systray" "clock" "notifications" ];
          };
        };
      };

      settings = { };
    };
  };
}
