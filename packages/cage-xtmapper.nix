{ stdenv, fetchurl, autoPatchelfHook }:
stdenv.mkDerivation (finalAttrs: {
  pname = "";
  version = "0.2.0";
  src = fetchurl {
    url =
      "https://github.com/Xtr126/cage-xtmapper/releases/download/latest/cage-xtmapper-v0.2.0.tar";
    hash = "";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  sourceRoot = "usr/local/bin";

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 cage_xtmapper cage_xtmapper.sh -t $out/bin/
  '';

  meta = { platforms = stdenv.lib.platforms.linux; 
  };
  dontBuild = true;
  dontConfigure = true;
})
