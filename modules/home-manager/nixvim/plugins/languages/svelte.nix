{ lib, pkgs }: {
  plugins = { lsp.servers = { svelte.enable = true; }; };
  keymaps = [ ];
}
