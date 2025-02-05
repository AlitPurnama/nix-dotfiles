{ lib, inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/nixos/kernel.nix
    ./modules/nixos/stylix.nix
    ./modules/nixos/podman.nix
    ./modules/nixos/protonvpn.nix
    ./modules/nixos/files.nix
  ];

  files.enable = true;

  podman.enable = true;
  services.protonvpn = {
    enable = true;
    autostart = false;
    interface = {
      name = "levpn";
      ip = "10.2.0.2/32";
      privateKeyFile = "/home/alit/.dotfiles/secret/protonvpn";
      dns = {
        enable = true;
        ip = "10.2.0.1";
      };
    };
    endpoint = {
      publicKey = "+tBxOtFy6U050wKXUHW16Ya8gzRVoAGdSZGQ2PokrGA=";
      ip = "149.22.84.149";
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tenslime"; # Define your hostname.

  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";

  services.resolved.enable = true;

  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];

  time.timeZone = "Asia/Jayapura";

  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.hyprland = {
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.zsh.enable = true;

  users.users.alit = {
    isNormalUser = true;
    description = "Alit Purnama";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "alit" = import ./home.nix; };
  };

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
  programs.steam.gamescopeSession.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [ git cloudflare-warp mpv ];

  systemd.packages = [ pkgs.cloudflare-warp ]; # for warp-cli
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "cloudflare-warp"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
