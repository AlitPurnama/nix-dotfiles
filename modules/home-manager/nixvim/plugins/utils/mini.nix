{ lib, pkgs }: {

  plugins.mini = {
    enable = true;
    modules = {
      icons = { };
      splitjoin = { };
      comment = {
        mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
        };
      };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
      files = {
        mappings = {
          go_in = "<CR>";
          go_in_plus = "L";
          go_out = "-";
          go_out_plus = "H";
        };
      };
    };
    mockDevIcons = true;
  };
  keymaps = [
    {
      __unkeyed-1 = "<leader>ee";
      __unkeyed-2 = {
        __raw = # lua
          ''
            function()
                require("mini.files").open()
            end
          '';
      };
      desc = "Toggle Mini File Explorer";

    }
    {
      __unkeyed-1 = "<leader>ef";
      __unkeyed-2 = {
        __raw = # lua
          ''
            function()
                MiniFiles = require("mini.files")
                MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
                MiniFiles.reveal_cwd()
            end
          '';
      };
      desc = "Toggle into currently opened file";
    }
    # Split Join
    {
      __unkeyed-1 = "sj";
      __unkeyed-2 = {
        __raw = ''
          function()
              require("mini.splitjoin").join()
          end
        '';
      };
      desc = "Join Arguments";
      mode = [ "n" "x" ];
    }
  ];
}
