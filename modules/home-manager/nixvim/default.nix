{ inputs, lib, config, ... }:
with lib;
let
  cfg = config.nixvim;
  opts = (import ./options.nix { }).config.opts;
  globals = (import ./options.nix { }).config.globals;
  clipboard = (import ./clipboard.nix { inherit pkgs; }).config.clipboard;
in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ./plugins ./keymaps.nix ];
  options.nixvim.enable = mkEnableOption "Enable Nixvim";
  config = mkIf cfg.enable {
    lsp.enable = true;
    keymaps.enable = true;
    completion.enable = true;
    treesitter.enable = true;
    snippets.enable = true;
    formatters.enable = true;
    files.enable = true;
    mini.enable = true;
    snacks.enable = true;
    utils.enable = true;
    programs.nixvim = {
      enable = true;
      inherit opts globals clipboard;
    };
  };
}
