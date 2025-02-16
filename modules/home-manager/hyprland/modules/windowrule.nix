{ lib }:
with lib;
let
  blurApps = [ "firefox" "[Cc]ode" "com.mitchellh.ghostty" ];
  generateOpacityRule = app: "opacity 0.90 0.90,class:^(${app})$";
in {
  windowrulev2 = [
    # XtMapper rules
    "float, title:(XtMapper)"
    "noblur, title:(XtMapper)"
    "size 100% 100%, title:(XtMapper)"
    "move 0 0, title:(XtMapper)"
    "stayfocused, title:(XtMapper)"

    # Waydroid rule
    "fullscreen, title:(Waydroid)"
  ] ++ (map generateOpacityRule blurApps);
}
