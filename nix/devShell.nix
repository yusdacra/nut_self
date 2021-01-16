{ common }:
with common; with pkgs;
mkDevShell {
  packages =
    [ git nixpkgs-fmt rustc ]
    ++ crateDeps.nativeBuildInputs ++ crateDeps.buildInputs;
  env = {

    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${lib.makeLibraryPath neededLibs}";
  } // env;
}
