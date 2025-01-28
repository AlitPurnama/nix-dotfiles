{ config, lib, ... }:
with lib;
let cfg = config.completion;
in {
  options.completion.enable = mkEnableOption "Enable Completion";
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      blink-cmp = {
        enable = true;
        settings = { keymap = { preset = "super-tab"; }; };
      };
      blink-compat.enable = true;
    };
  };
}
