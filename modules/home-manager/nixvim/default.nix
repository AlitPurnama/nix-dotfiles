{ inputs, lib, config, ... }:
with lib;
let
  cfg = config.nixvim;
  opts = (import ./options.nix { inherit config; }).config.opts;
  globals = (import ./options.nix { inherit config; }).config.globals;
in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ./plugins ];
  options.nixvim.enable = mkEnableOption "Enable Nixvim";
  config = mkIf cfg.enable {
    lsp.enable = true;
    completion.enable = true;
    treesitter.enable = true;
    snippets.enable = true;
    formatters.enable = true;
    files.enable = true;
    mini.enable = true;
    programs.nixvim = {
      enable = true;
      inherit opts globals;
    };
  };
}
