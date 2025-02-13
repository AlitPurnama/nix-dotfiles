{ pkgs, inputs }: {
  plugins =
    with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
    [ hyprexpo ];
}
