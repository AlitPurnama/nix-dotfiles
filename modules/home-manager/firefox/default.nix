{ inputs ,lib, config, ... }: with lib;
let
  cfg = config.firefox;
  extensions = ( import ./extensions.nix { inherit inputs config; }).config.extensions;
in
{
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
      profiles.${cfg.profile} = {
        inherit extensions;
      };
    };
  };
}
