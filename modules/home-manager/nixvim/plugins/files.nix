{ config, lib, ... }:
with lib;
let cfg = config.files;
in {
  options.files = {
    enable = mkEnableOption "Enable Files";
    enableOil = mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Enable or disable oil.nvim";
    };
  };
  config = mkIf cfg.enable {
    programs.nixvim.keymaps = [{
      action = "<cmd>Oil<cr>";
      key = "-";
      options.silent = true;
      mode = [ "n" ];
    }];
    programs.nixvim.plugins = {
      oil = {
        enable = cfg.enableOil;
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
    };
  };
}
