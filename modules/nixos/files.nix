{ lib, config, ... }:
with lib;
let cfg = config.files;
in {
  options.files.enable = mkEnableOption "Enable Automount disk";
  config = mkIf cfg.enable {
    boot.supportedFilesystems = [ "ntfs" ];
    fileSystems = {
      "/home/alit/Disks/Data" = {
        device = "/dev/disk/by-uuid/2426187726184C64";
        fsType = "ntfs-3g";
        options =
          [ "rw" "auto" "exec" "nls=utf8" "umask=003" "gid=100" "uid=1000" ];
      };
      "/home/alit/Disks/Development" = {
        device = "/dev/disk/by-uuid/9252D84C52D836A7";
        fsType = "ntfs-3g";
        options =
          [ "rw" "auto" "exec" "nls=utf8" "umask=003" "gid=100" "uid=1000" ];
      };
    };
  };

}
