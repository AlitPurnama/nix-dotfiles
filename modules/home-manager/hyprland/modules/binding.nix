{ config, pkgs }:
{
  config = {
   bind =
         [
	   "$mod, Q, killactive"

           "$mod, F, exec, firefox"
	   "$mod, R, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
	   "$mod, T, exec, ghostty"

	   "$mod, Tab, workspace, m+1"
	   "$mod SHIFT, Tab, workspace, m-1"
         ]
         ++ (
           builtins.concatLists (builtins.genList (i:
               let ws = i + 1;
               in [
                 "$mod, code:1${toString i}, workspace, ${toString ws}"
                 "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
               ]
             )
             9)
         );
  };
}
