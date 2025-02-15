{ lib, pkgs }: {
  plugins = { lsp.servers = { ts_ls = { enable = true; }; }; };
  keymaps = [ ];
}
