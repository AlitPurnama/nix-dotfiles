{ pkgs, lib, ... }:
with lib;
let cfg = config.zsh;
in {
  options.zsh.enable = mkEnableOption "Enable Zsh";
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza --icons=always";
        cd = "z";
      };
      history = { ignorePatterns = [ "rm *" "pkill *" ]; };
    };
  };
}
