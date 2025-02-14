{ lib, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/ghostty.nix
    ../../modules/home-manager/firefox
    ../../modules/home-manager/hyprpanel.nix
    ../../modules/home-manager/shell.nix
    ../../modules/home-manager/yazi.nix
    ../../modules/home-manager/nixvim
    ../../modules/home-manager/obs.nix
    ../../modules/home-manager/atuin.nix
    ../../modules/home-manager/stylix.nix
  ];

  home.username = "alit";
  home.homeDirectory = "/home/alit";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    goofcord
    prismlauncher
    spotify
    motrix
    mcaselector
    pfetch-rs
    ani-cli
    zathura
    mangohud
    glfw3-minecraft
    wl-clipboard-rs
    mullvad-browser
    playerctl
  ];

  home.file = { };

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

  programs.tmux = { enable = true; };
  programs.lazygit.enable = true;

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];

  hyprland.enable = true;
  hyprpanel.enable = true;
  ghostty.enable = true;
  firefox.enable = true;
  shell.enable = true;
  yazi.enable = true;
  nixvim.enable = true;
  obs-studio.enable = true;
  atuin.enable = true;
}
