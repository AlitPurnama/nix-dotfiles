{ lib, pkgs }: {
  plugins = {
    lsp.servers = {
      svelte.enable = true;
      tailwindcss.enable = true;
    };
  };
  keymaps = [ ];
}
