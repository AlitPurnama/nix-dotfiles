{ config, lib, ... }:
with lib;
let cfg = config.pyprland;
in {
  options.pyprland.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable Pyprland";
  };
  config = mkIf cfg.enable {
    home.packages = [ inputs.pyprland.packages."x86_64-linux".pyprland ];
    wayland.windowManager.hyprland.bind = [
      # Pypr zoom
      "$mod, Z, exec, pypr zoom ++0.5"
      "$mod, SHIFT, Z, exec, pypr zoom"
      # layout center
      "$mod, M, exec, pypr layout_center toggle"
      "$mod, left, exec, pypr layout_center prev"
      "$mod, right, exec, pypr layout_center next"
    ];
    wayland.windowManager.hyprland.exec-once = [ "pyprland" ];
    xdg.configFile."hypr/pyprland.toml" = {
      enable = true;
      text = # toml
        ''
          [pyprland]
          plugins = [
            "magnify"
            "scratchpads"
            "toggle_special"
            "layout_center"
          ]
          [layout_center]
          margin = 60
          offset = [0, 30]
          next = "movefocus r"
          prev = "movefocus l"
          next2 = "movefocus d"
          prev2 = "movefocus u"
        '';
    };
  };
}
