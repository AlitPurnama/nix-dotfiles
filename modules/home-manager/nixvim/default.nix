{ pkgs, inputs, lib, config, ... }:
with lib;

let
  cfg = config.nixvim;

  # Function to recursively find all .nix files in a directory
  findNixFiles = dir:
    let
      files = builtins.readDir dir;
      nixFiles = filter (name: hasSuffix ".nix" name) (attrNames files);
      subdirs = filterAttrs (name: type: type == "directory") files;
      subdirFiles =
        concatMap (name: findNixFiles (dir + "/${name}")) (attrNames subdirs);
    in map (file: dir + "/${file}") nixFiles ++ subdirFiles;

  pluginsDir = ./plugins;
  nixFiles = findNixFiles pluginsDir;

  # Import plugins and pass necessary arguments
  importedPlugins = map (file: import file { inherit lib pkgs; }) nixFiles;

  # Import options and globals once
  opts = (import ./options.nix { }).opts;
  globals = (import ./options.nix { }).globals;
  clipboard = (import ./clipboard.nix { inherit pkgs; }).clipboard;
  defKeymaps = (import ./keymaps.nix { }).keymaps;

  # Extract plugins and keymaps from imported modules
  allPlugins = foldl' (acc: plugin: mkMerge [ acc (plugin.plugins or { }) ]) { }
    importedPlugins;
  allKeymaps =
    foldl' (acc: plugin: acc ++ (plugin.keymaps or [ ])) [ ] importedPlugins;

in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options.nixvim.enable = mkEnableOption "Enable Nixvim";

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      inherit opts globals clipboard;

      plugins = mkMerge [
        allPlugins
        {

          which-key = {
            enable = true;
            settings = { spec = mkMerge [ defKeymaps allKeymaps ]; };
          };
        }
      ]; # Use merged plugins
    };
  };
}
