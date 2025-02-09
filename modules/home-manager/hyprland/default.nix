{ lib, config, inputs, pkgs, ... }:
with lib;
let
  cfg = config.hyprland;
  bind = (import ./modules/binding.nix { inherit pkgs; }).bind;
  exec-once = (import ./modules/exec.nix { inherit pkgs; }).exec-once;
in {
  options.hyprland.enable = mkEnableOption "Enable Hyprland";
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      settings = {
        "$mod" = "SUPER";
        monitor = [ ",preffered,auto,1" ];
        inherit bind exec-once;
      };
    };
  };
}
