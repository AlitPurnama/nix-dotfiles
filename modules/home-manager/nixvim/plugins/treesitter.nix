{ lib, pkgs }:
let
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

  treesitterSettings = {
    highlight.enable = true;
    auto_install = true;
  };

in {
  plugins = {
    treesitter = {
      enable = true;
      settings = treesitterSettings;
      grammarPackages = grammarPackages;
    };
    ts-autotag.enable = true;
  };
  keymaps = [ ];
}
