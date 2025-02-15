{ lib, stdenv, fetchurl, autoPatchelfHook
, wayland, libdrm, libxkbcommon, pixman, mesa, vulkan-loader
, systemd, seatd, xorg, libglvnd
}:

stdenv.mkDerivation rec {
  pname = "cage-xtmapper";
  version = "0.2.0";

  src = fetchurl {
    url = "https://github.com/Xtr126/cage-xtmapper/releases/download/latest/cage-xtmapper-v0.2.0.tar";
    hash = "sha256-x1ihGdF2k9S+6e6XRZaS6fK+qJQHfdCA4JTb4VkkNM8=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [
    wayland
    libdrm
    libxkbcommon
    pixman
    mesa
    mesa.drivers
    vulkan-loader
    systemd
    seatd
    xorg.libxcb
    xorg.xcbutilrenderutil
    libglvnd
  ];

  # Explicitly add mesa driver paths to runtime search
  runtimeDependencies = [ mesa.drivers ];

  sourceRoot = "usr/local/bin";

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 cage_xtmapper cage_xtmapper.sh -t $out/bin/
  '';

  meta = {
    description = "Cage XtMapper";
    platforms = lib.platforms.linux;
  };

  dontBuild = true;
  dontConfigure = true;
}
