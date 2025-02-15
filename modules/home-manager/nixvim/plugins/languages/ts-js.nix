{ lib, pkgs }: {
  plugins = {
    lsp.servers = {
      ts_ls = { enable = true; };
      none-ls.sources.formatting.prettierd.enable = true;
    };
  };
  keymaps = [ ];
}
