{ config, lib, pkgs, inputs, ... }:
with lib;
let cfg = config.spotify;

in {
  imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];
  options.spotify.enable = mkEnableOption "Enable Spotify";
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ spotify ];
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
        keyboardShortcut
        trashbin
        beautifulLyrics
        betterGenres
        copyToClipboard
      ];
      theme = spicePkgs.themes.comfy;
      colorScheme = "Mono";
    };
  };
}
