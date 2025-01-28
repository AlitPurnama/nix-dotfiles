{ config, pkgs, lib, ... }:with lib;
let
  cfg = config.shell;
in{
  options.shell = {
    enable = mkEnableOption "Enable Config";
  };
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
      history = {
        ignorePatterns = [ "rm *" "pkill *" ];
      };
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.starship = {
      enable = true;
    };
  };
}
