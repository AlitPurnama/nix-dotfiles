{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.snacks;

  terminalSettings = {
    position = "float";
    backdrop = 60;
    height = 0.9;
    width = 0.9;
    zindex = 50;
  };

  dashboardPresetKeys = [
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

  dashboardSections = [
    {
      section = "terminal";
      cmd =
        "${pkgs.ascii-image-converter}/bin/ascii-image-converter ~/.dotfiles/icons/rmu.png -C -c";
      random = 10;
      pane = 2;
      indent = 4;
      height = 30;
    }
    {
      icon = " ";
      pane = 1;
      title = "Keymaps";
      section = "keys";
      padding = 1;
      indent = 3;
    }
    {
      icon = " ";
      pane = 1;
      title = "Recent Files";
      section = "recent_files";
      padding = 1;
      indent = 3;
    }
    {
      icon = " ";
      pane = 1;
      title = "Projects";
      section = "projects";
      padding = 1;
      indent = 3;
    }
    {
      pane = 1;
      icon = " ";
      title = "Git Status";
      section = "terminal";
      enabled.__raw = "Snacks.git.get_root() ~= nil";
      cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
      height = 5;
      padding = 1;
      ttl = 5 * 60;
      indent = 3;
    }
  ];
in {
  options.snacks = {
    enable = mkEnableOption "Enable Snacks module";
    enableDashboard = mkOption {
      type = types.bool;
      default = true;
      description = "Enable the Snacks dashboard";
    };
    enableLazygit = mkOption {
      type = types.bool;
      default = true;
      description = "Enable LazyGit integration";
    };
    enablePick = mkOption {
      type = types.bool;
      default = true;
      description = "Enable the pick feature";
    };
    enableScroll = mkOption {
      type = types.bool;
      default = true;
      description = "Enable the scroll feature";
    };
    enableTerminal = mkOption {
      type = types.bool;
      default = true;
      description = "Enable the terminal feature";
    };
  };

  config = mkIf cfg.enable {
    programs.nixvim.plugins.snacks = {
      enable = true;
      settings = {
        animate.enabled = mkDefault true;
        scroll.enabled = mkDefault cfg.enableScroll;
        pick.enabled = mkDefault cfg.enablePick;
        terminal = mkIf cfg.enableTerminal {
          enabled = true;
          win = terminalSettings;
        };
        dashboard = mkIf cfg.enableDashboard {
          enabled = true;
          row = { __raw = "nil"; };
          col = { __raw = "nil"; };
          preset.keys = dashboardPresetKeys;
          sections = dashboardSections;
        };
        lazygit = mkIf cfg.enableLazygit { enabled = true; };
        notifier = { enabled = mkDefault true; };
      };
    };
  };
}
