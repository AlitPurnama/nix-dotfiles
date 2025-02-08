{ lib, config, pkgs, ... }:
with lib;
let cfg = config.obs-studio;
in {
  options.obs-studio.enable = mkEnableOption "Enable obs studio";
  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-tuna
        obs-vaapi
        obs-vkcapture
        obs-gstreamer
      ];
    };
  };
}
