{ ... }: {
  imports = [
    ./lsp.nix
    ./treesitter.nix
    ./completion.nix
    ./snippets.nix
    ./formatters.nix
  ];
}
