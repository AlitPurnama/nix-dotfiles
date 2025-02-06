{ ... }: {
  imports = [
    ./lsp.nix
    ./treesitter.nix
    ./completion.nix
    ./formatters.nix
    ./files.nix
    ./languages
    ./utils
  ];
}
