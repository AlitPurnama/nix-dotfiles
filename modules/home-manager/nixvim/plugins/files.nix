{ lib, pkgs }: {
  plugins = {
    flash.enable = true;
    oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        view_options.show_hidden = false;
        keymaps = {
          "<C-r>" = "actions.refresh";
          "<leader>qq" = "actions.close";
          "y." = "actions.copy_entry_path";
        };
      };
    };

    telescope = {
      enable = true;
      settings = { };
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
        live-grep-args.enable = true;
      };
    };
  };

  keymaps = [{
    __unkeyed-1 = "-";
    __unkeyed-2 = "<cmd>Oil<cr>";
    mode = "n";
    desc = "Open File Browser";
  }];
}
