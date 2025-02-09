{ pkgs }:
let
  dontExitSteam = pkgs.pkgs.writeShellScriptBin "dontExitSteam" ''
    if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
        ${pkgs.xdotool}/bin/xdotool getactivewindow windowunmap
    else
        hyprctl dispatch killactive ""
    fi

  '';

  cliphist = "${pkgs.cliphist}/bin/cliphist";
  rofi = "${pkgs.rofi-wayland}/bin/rofi";
  wl-copy = "${pkgs.wl-clipboard-rs}/bin/wl-copy";
in {
  bind = [
    "$mod, Q, exec, ${dontExitSteam}/bin/dontExitSteam"

    "$mod, F, exec, firefox"
    #rofi
    "$mod, R, exec, ${rofi} -show drun"
    "$mod, V, exec, ${cliphist} list | ${rofi} -dmenu | ${cliphist} decode | ${wl-copy}"
    #open terminal
    "$mod, T, exec, ghostty"

    # Cycle through workspace
    "$mod, Tab, workspace, m+1"
    "$mod SHIFT, Tab, workspace, m-1"

  ] ++ (builtins.concatLists (builtins.genList (i:
    let ws = i + 1;
    in [
      "$mod, code:1${toString i}, workspace, ${toString ws}"
      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    ]) 9));
}
