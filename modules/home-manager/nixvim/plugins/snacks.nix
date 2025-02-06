{ pkgs, config, lib, ... }:
with lib;
let cfg = config.snacks;
in {
  options.snacks = {
    enable = mkEnableOption "Enable Snacks";
    enableDashboard = mkOption {
      default = true;
      type = types.bool;
    };
    enableLazygit = mkOption {
      default = true;
      type = types.bool;
    };
  };
  config = mkIf cfg.enable {
    programs.nixvim.plugins.snacks = {
      enable = true;
      settings = {
        dashboard = {
          enabled = cfg.enableDashboard;
          sections = [
            { section = "header"; }
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
            { section = "startup"; }
            {
              section = "terminal";
              cmd =
                "${pkgs.ascii-image-converter}/bin/ascii-image-converter ~/.dotfiles/icons/Rimuru.Tempest.1024.2619740.png -C -c";
              random = 10;
              pane = 2;
              indent = 4;
              height = 30;
            }
          ];
        };
        lazygit = { enabled = cfg.enableLazygit; };
        notifier = { enabled = true; };
      };
    };
  };
}
