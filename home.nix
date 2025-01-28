{ lib, config, pkgs, ... }:

{
  imports = [
    ./modules/home-manager/hyprland
    ./modules/home-manager/ghostty.nix
    ./modules/home-manager/firefox
    ./modules/home-manager/hyprpanel.nix
    ./modules/home-manager/shell.nix
    ./modules/home-manager/yazi.nix
    ./modules/home-manager/nvf
    ./modules/home-manager/nixvim
  ];

  hyprland.enable = true;
  hyprpanel.enable = true;
  ghostty.enable = true;
  firefox.enable = true;
  shell.enable = true;
  yazi.enable = true;
  nixvim.enable = true;
  home.username = "alit";
  home.homeDirectory = "/home/alit";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs;[
    goofcord
    prismlauncher
    gabutdm
    spotify
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    bash.enable = true;
  };

  programs.home-manager.enable = true;


  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "spotify"
           ];


}
