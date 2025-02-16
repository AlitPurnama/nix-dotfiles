{ pkgs, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.enable = true;
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 3;
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.plymouth = {
    enable = true;
    font =
      "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";
  };
}
