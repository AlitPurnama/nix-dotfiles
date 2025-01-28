{ inputs, lib, config, pkgs, ... }:with lib;
let
  cfg = config.nvf;
in{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  options.nvf.enable = mkEnableOption "Enable NVF";
  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      enableManpages = true;
      settings = {
        vim = {
	  viAlias = true;
	  vimAlias = true;
	  lsp = {
	    enable = true;
            null-ls = {
              enable = true;
            };
	  };
          completion.nvim-cmp = {
            enable = true;
          };
	  languages = {
	    nix.enable = true;
	    ts.enable = true;
	    go.enable = true;
	  };
	  lazy.plugins = {
	    "hardtime.nvim" = {
	      package = pkgs.vimPlugins.hardtime-nvim;
	      setupModule = "hardtime";
	      lazy = true;
	    };
	  };
	};
      };
    };
  };
}
