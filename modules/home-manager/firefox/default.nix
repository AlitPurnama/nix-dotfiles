{ inputs, lib, config, ... }:
with lib;
let
  cfg = config.firefox;
  profile-default = (import ./profile-default.nix { inherit inputs; }).profile;
in {
  options.firefox = {
    enable = mkEnableOption "Enable Firefox";
    profile = mkOption {
      type = lib.types.str;
      default = "tenslime";
      example = "tenslime";
      description = "Profile name";
    };
  };
  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.${cfg.profile} = profile-default;
    };
  };
}
