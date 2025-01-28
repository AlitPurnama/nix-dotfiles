{ lib, config, pkgs, ... }:
with lib;
let cfg = config.treesitter;
in {
  options.treesitter.enable = mkEnableOption "Enable Treesitter";
  config = mkIf cfg.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };
  };
}
