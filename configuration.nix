# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, inputs, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/nixos/stylix.nix
    ./modules/nixos/podman.nix
    # ./modules/nixos/files.nix
  ];

  podman.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tenslime"; # Define your hostname.

  networking.networkmanager.enable = true;

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

  services.cron = {
    enable = true;
    systemCronJobs = [
      # "*/2 * * * *      alit  ${pkgs.php84}/bin/php    /home/alit/Projects/oci-script/oci-arm-host-capacity/index.php >> /home/alit/Projects/oci-script/oci-arm-host-capacity/oci.log"
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    # neovim
    git
    cloudflare-warp
    mpv
  ];

  systemd.packages = [ pkgs.cloudflare-warp ]; # for warp-cli
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "cloudflare-warp" ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
