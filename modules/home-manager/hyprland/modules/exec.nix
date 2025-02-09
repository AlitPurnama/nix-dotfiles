{ pkgs }:
let
  wl-paste = "${pkgs.wl-clipboard-rs}/bin/wl-paste";
  cliphist = "${pkgs.cliphist}/bin/cliphist";
in {
  exec-once = [
    "${wl-paste} --type text --watch ${cliphist}"
    "${wl-paste} --type image --watch ${cliphist} store"
  ];
}
