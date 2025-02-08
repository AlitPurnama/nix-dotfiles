{ pkgs, lib }:
let

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
        "${pkgs.ascii-image-converter}/bin/ascii-image-converter ~/.dotfiles/images/icons/rmu.png -C -c";
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

  plugins = {
    snacks = {
      enable = true;
      settings = {
        animate.enabled = true;
        scroll.enabled = true;
        picker = {
          enabled = true;
          win = {
            input.keys = {
              "<a-s>" = {
                __unkeyed-1 = "flash";
                mode = [ "n" "i" ];
              };
              "s" = { __unkeyed-1 = "flash"; };
            };
          };
          actions = {
            flash = {
              __raw = # lua
                ''
                  function(picker)
                    require("flash").jump({
                      pattern = "^",
                      label = { after = { 0, 0 } },
                      search = {
                        mode = "search",
                        exclude = {
                          function(win)
                            return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                          end,
                        },
                      },
                      action = function(match)
                        local idx = picker.list:row2idx(match.pos[1])
                        picker.list:_move(idx, true, true)
                      end,
                  })
                  end
                '';
            };
          };
        };
        terminal = {
          enabled = true;
          win = terminalSettings;
        };
        dashboard = {
          enabled = true;
          row = { __raw = "nil"; };
          col = { __raw = "nil"; };
          preset.keys = dashboardPresetKeys;
          sections = dashboardSections;
        };
        lazygit = { enabled = true; };
        notifier = { enabled = true; };
        bigfile = { enabled = true; };
        indent.enabled = true;
        input.enabled = true;
        toggle.enabled = true;
        scope.enabled = true;
      };
    };
  };

  keymaps = [

  ];
}
