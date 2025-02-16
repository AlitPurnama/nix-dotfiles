{ pkgs, lib }: {
  plugins = {
    lsp.servers = { gopls.enable = true; };
    none-ls.sources.formatting = {
      gofmt.enable = true;
      goimports_reviser.enable = true;
    };
  };
}
