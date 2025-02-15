{ lib, config, inputs, pkgs, ... }:
with lib;
let
  cfg = config.hyprland;
  bind = (import ./modules/binding.nix { inherit pkgs; }).bind;
  bindle = (import ./modules/binding.nix { inherit pkgs; }).bindle;
  bindm = (import ./modules/binding.nix { inherit pkgs; }).bindm;
  exec-once = (import ./modules/exec.nix { inherit pkgs; }).exec-once;
  decoration = (import ./modules/decoration.nix { }).decoration;
  animations = (import ./modules/animations.nix { }).animations;
  windowrulev2 =
    (import ./modules/windowrule.nix { inherit lib; }).windowrulev2;
in {
  imports = [ ./modules/pyprland.nix ];
  options.hyprland.enable = mkEnableOption "Enable Hyprland";
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      settings = {
        "$mod" = "SUPER";
        monitor = [ ",preffered,auto,1" ];
        inherit bind exec-once bindle bindm windowrulev2 decoration animations;
      };
    };
  };
}
