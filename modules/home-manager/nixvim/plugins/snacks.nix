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
        pick.enabled = true;
        dashboard = {
          enabled = cfg.enableDashboard;
          preset = {
            keys = [
              {
                icon = " ";
                key = "f";
                desc = "Find File";
                action = "<leader>ff";
              }
              {
                icon = " ";
                key = "n";
                desc = "New File";
                action = ":ene | startinsert";
              }
              {
                icon = " ";
                key = "/";
                desc = "Find Text";
                action = "<leader>fr";
              }
              {
                icon = " ";
                key = "r";
                desc = "Recent Files";
                action = "<leader>fg";
              }
              {
                icon = "";
                key = "o";
                desc = "LazyGit";
                action = "<leader>gg";
              }
              {
                icon = " ";
                key = "q";
                desc = "Quit";
                action = ":qa";
              }
            ];
          };
          sections = [
            {
              section = "terminal";
              cmd =
                "${pkgs.ascii-image-converter}/bin/ascii-image-converter ~/.dotfiles/icons/le-rimuru.png -C -c";
              random = 10;
              pane = 1;
              indent = 4;
              height = 30;
            }
            {
              icon = " ";
              pane = 2;
              title = "Keymaps";
              section = "keys";
              padding = 1;
              indent = 3;
            }
            {
              icon = " ";
              pane = 2;
              title = "Recent Files";
              section = "recent_files";
              padding = 1;
              indent = 3;
            }
            {
              icon = " ";
              pane = 2;
              title = "Projects";
              section = "projects";
              padding = 1;
              indent = 3;
            }
            {
              pane = 2;
              icon = " ";
              title = "Git Status";
              section = "terminal";
              enabled.__raw = ''
                Snacks.git.get_root() ~= nil
              '';
              cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
              height = 5;
              padding = 1;
              ttl = 5 * 60;
              indent = 3;
            }
          ];
        };
        lazygit = { enabled = cfg.enableLazygit; };
        notifier = { enabled = true; };
      };
    };
  };
}
